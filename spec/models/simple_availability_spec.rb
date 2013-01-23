require 'spec_helper'

describe SimpleAvailability do

  it "has a list of days available in a week" do
    SimpleAvailability::DAYS.should match_array([ :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday ])
  end

  it "accepts an initializer hash of attributes" do
    availability = SimpleAvailability.new({
      :start_day => :wednesday,
      :end_day => :thursday,
      :start_time => 0,
      :end_time => 1
    })
    availability.start_day.should == :wednesday
    availability.end_day.should == :thursday
    availability.start_time.should == Time.at(0).utc
    availability.end_time.should == Time.at(1).utc
  end

  it "raises exceptions when initialized with wrong values" do
    expect { SimpleAvailability.new( :start_day => nil ) }.to raise_error
    expect { SimpleAvailability.new( :end_day => :garbage ) }.to raise_error
    expect { SimpleAvailability.new( :start_time => Object.new ) }.to raise_error
    expect { SimpleAvailability.new( :end_time => "garbage" ) }.to raise_error
  end

  it "allows you to initialize with a block" do
    availability = SimpleAvailability.new do |a|
      a.start_day = :wednesday
      a.end_day = :thursday
      a.start_time = 0
      a.end_time = 1
    end
    availability.start_day.should == :wednesday
    availability.end_day.should == :thursday
    availability.start_time.should == Time.at(0).utc
    availability.end_time.should == Time.at(1).utc
  end

  context "with a constructed simple availability" do

    before(:each) do
      @availability = SimpleAvailability.new
    end

    it "lets you specify a start day" do
      @availability.start_day = "monday"
      @availability.start_day.should == :monday

      @availability.start_day = :tuesday
      @availability.start_day.should == :tuesday
    end

    it "lets you specify an end day" do
      @availability.end_day = "monday"
      @availability.end_day.should == :monday

      @availability.end_day = :thursday
      @availability.end_day.should == :thursday
    end

    it "throws exceptions for invalid days when assigned" do
      expect { @availability.start_day = nil }.to raise_error( SimpleAvailability::InvalidDay )
      expect { @availability.start_day = "garbage" }.to raise_error( SimpleAvailability::InvalidDay )

      expect { @availability.end_day = nil }.to raise_error( SimpleAvailability::InvalidDay )
      expect { @availability.end_day = "garbage" }.to raise_error( SimpleAvailability::InvalidDay )
    end

    it "lets you specify a start time" do
      # Start of a day is valid
      @availability.start_time = Time.at(0)
      @availability.start_time.should < Time.now

      # Last second in the day is valid to
      @availability.start_time = Time.at(86399)
      @availability.start_time.should > Time.at(0)
    end

    it "lets you specify an end time" do
      # Start of a day is valid
      @availability.end_time = 0
      @availability.end_time.should < Time.now

      # Last second in the day is valid to
      @availability.end_time = 86399
      @availability.end_time.should > Time.at(0)
    end

    it "throws exceptions for invalid times" do
      expect { @availability.end_time = nil }.to raise_error( SimpleAvailability::InvalidTime )
      expect { @availability.end_time = -1 }.to raise_error( SimpleAvailability::InvalidTime )
      expect { @availability.end_time = 86400 }.to raise_error( SimpleAvailability::InvalidTime )

      expect { @availability.start_time = nil }.to raise_error( SimpleAvailability::InvalidTime )
      expect { @availability.start_time = -1 }.to raise_error( SimpleAvailability::InvalidTime )
      expect { @availability.start_time = 86400 }.to raise_error( SimpleAvailability::InvalidTime )
    end

    it "knows when it spans multiple days" do
      @availability.start_day = :monday
      @availability.end_day = :wednesday
      @availability.multiple_days?.should be_true

      @availability.end_day = :monday
      @availability.multiple_days?.should be_false
    end

    it "knows when it is only on a single day" do
      @availability.start_day = :monday
      @availability.end_day = :monday
      @availability.single_day?.should be_true

      @availability.end_day = :tuesday
      @availability.single_day?.should be_false
    end

    it "creates pricing block periods reflecting itself" do
      @availability.start_day = :monday
      @availability.end_day = :sunday
      pricing_blocks = @availability.to_pricing_block_periods
      pricing_blocks.count.should == 7
      pricing_blocks.first.day_of_week.should == :monday
      pricing_blocks.last.day_of_week.should == :sunday
      pricing_blocks.first.start_time.should == @availability.start_time
      pricing_blocks.first.end_time.should == @availability.end_time
    end

    it "creates pricing rates reflecting itself" do
      @availability.start_day = :tuesday
      @availability.end_day = :thursday
      rates = @availability.to_pricing_rates
      rates.count.should == 3
      rates.first.day_of_week.should == :tuesday
      rates.last.day_of_week.should == :thursday
      rates.first.start_time.should == @availability.start_time
      rates.first.end_time.should == @availability.end_time
    end

    it "knows about times crossing from the evening into the morning" do
      @availability.start_day = :monday
      @availability.end_day = :monday
      @availability.start_time = 20.hours
      @availability.end_time = 4.hours
      @availability.time_blocks.count.should == 2
    end

    it "can tell you if a day is valid or not" do
      @availability.valid_day?(:monday).should be_true
      @availability.valid_day?("monday").should be_true
      @availability.valid_day?(:christmas).should be_false
    end

    it "will let you step through each day specified in the availability" do
      @availability.start_day = :monday
      @availability.end_day = :sunday
      available_days = @availability.days
      available_days.count.should == 7
      available_days.should match_array(SimpleAvailability::DAYS)
    end

    it "should return the correct days when spanning across the end of the week" do
      @availability.start_day = :saturday
      @availability.end_day = :tuesday
      @availability.days.count.should == 4
      @availability.days.include?(:friday).should be_false
      @availability.days.include?(:wednesday).should be_false
    end

    it "is aware of an availability that spans across the end of a week" do
      @availability.start_day = :saturday
      @availability.end_day = :tuesday
      @availability.spans_end_of_week?.should be_true

      @availability.end_day = :sunday
      @availability.spans_end_of_week?.should be_false
    end

    it "can test for overlap with another availability" do
      another = SimpleAvailability.new
      another.start_day = :monday
      another.end_day = :monday
      another.start_time = 6.hours
      another.end_time = 7.hours
      @availability.start_day = :tuesday
      @availability.end_day = :tuesday
      @availability.start_time = 7.hours
      @availability.end_time = 8.hours
      @availability.overlaps_with?(another).should be_false

      @availability.start_day = :monday
      @availability.overlaps_with?(another).should be_false

      @availability.start_time = 6.hours
      @availability.overlaps_with?(another).should be_true

      expect { @availability.overlaps_with?(nil) }.to raise_error
    end

    it "can modify itself for an inverse time" do
      @availability.start_time = 6.hours
      @availability.end_time = 7.hours
      @availability.inverse_time!
      @availability.start_time.should == Time.at( 7.hours ).utc
      @availability.end_time.should == Time.at( 6.hours ).utc
    end

  end

end