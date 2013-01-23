class SimpleAvailability

  # Invalid Day Exception
  class InvalidDay < ::Exception; end

  # Invalid Time Exception
  class InvalidTime < ::Exception; end

  # Structure to hold a start and an end time
  TimeBlock = Struct.new(:start_time, :end_time) do
    def is_during?(time)
      time >= start_time && time < end_time
    end

    def duration
      end_time - start_time
    end

    def overlaps?(block)
      !( block.start_time >= end_time || block.end_time <= start_time )
    end
  end

  # Days of the week, this constant is very important, the order determines
  # the beginning of the week and it also describes what each day is
  DAYS = [ :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday ]

  # Earliest timestamp aloud for keeping track of time
  MINIMUM_SECONDS = 0

  # Latest timestamp aloud for keeping track of time
  MAXIMUM_SECONDS = 86399

  attr_accessor :start_time, :end_time, :start_day, :end_day

  def initialize(attributes={})
    self.start_day = attributes.fetch(:start_day,default_start_day)
    self.end_day = attributes.fetch(:end_day,default_end_day)
    self.start_time = attributes.fetch(:start_time,default_start_time)
    self.end_time = attributes.fetch(:end_time,default_end_time)
    yield self if block_given?
  end

  def to_pricing_block_periods
    create_records_for PricingBlockPeriod
  end

  def to_pricing_rates
    create_records_for PricingRate
  end

  def overlaps_with?(availability)
    if availability.days.any? { |day| self.days.include?(day) }
      times = availability.time_blocks
      time_blocks.any? { |block| times.any?{ |time| block.overlaps?(time) } }
    else
      false
    end
  end

  def days
    if spans_end_of_week?
      DAYS.select { |day| DAYS.index(day) >= DAYS.index(start_day) || DAYS.index(day) <= DAYS.index(end_day) }
    else
      DAYS.select { |day| DAYS.index(day) >= DAYS.index(start_day) && DAYS.index(day) <= DAYS.index(end_day) }
    end
  end

  # Give the availability an inverse time on the same days
  def inverse_time!
    tmp = @start_time
    @start_time = @end_time
    @end_time = tmp
    self
  end

  def valid_day?(day)
    day.respond_to?(:to_sym) && DAYS.include?(day.to_sym)
  end

  def start_day=(day)
    raise InvalidDay unless valid_day? day
    @start_day = day.to_sym
  end

  def end_day=(day)
    raise InvalidDay unless valid_day? day
    @end_day = day.to_sym
  end

  def time_blocks
    blocks = []
    if spans_midnight?
      blocks << TimeBlock.new(make_time(MINIMUM_SECONDS),start_time)
      blocks << TimeBlock.new(end_time,make_time(MAXIMUM_SECONDS))
    else
      blocks << TimeBlock.new(start_time,end_time)
    end
    blocks
  end

  def start_time=(time)
    formatted = convert_to_time(time)
    raise InvalidTime unless formatted
    @start_time = formatted
  end

  def end_time=(time)
    formatted = convert_to_time(time)
    raise InvalidTime unless formatted
    @end_time = formatted
  end

  def single_day?
    start_day == end_day
  end

  def multiple_days?
    start_day != end_day
  end

  def spans_midnight?
    start_time > end_time
  end

  def spans_end_of_week?
    DAYS.index(start_day) > DAYS.index(end_day)
  end

  protected

  def default_start_day
    DAYS.first
  end

  def default_end_day
    DAYS.last
  end

  def default_start_time
    make_time(MINIMUM_SECONDS)
  end

  def default_end_time
    make_time(MAXIMUM_SECONDS)
  end

  # Returns a simple hash of keys that can be used to initialize
  # both a PricingBlockPeriod or PricingRate class
  def compatability_hash(day,time_block)
    { :day_of_week => day, :start_time => time_block.start_time, :end_time => time_block.end_time }
  end

  private

  def create_records_for(klass)
    items = []
    blocks = time_blocks
    days.each do |day|
      blocks.each { |block| items << klass.new( compatability_hash(day,block) ) }
    end
    items
  end

  # Attempts to try and convert seconds to a point in a day or
  # a Time object to a normalized time, all times are set to UTC
  # and set at the start of EPOC
  def convert_to_time(obj)
    case
      when obj.respond_to?(:seconds)
        obj.seconds >= MINIMUM_SECONDS && obj.seconds <= MAXIMUM_SECONDS ? make_time( obj.seconds ) : nil
      when obj.instance_of?(Time)
        make_time( obj.hour.hours + obj.min.minutes + obj.sec.seconds )
      else
        nil
    end
  end

  # Creates a time object from a timestamp of seconds and sets
  # it to UTC time
  def make_time(seconds)
    Time.at( seconds ).utc
  end

end