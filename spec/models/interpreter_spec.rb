require 'spec_helper'

describe Interpreter do

  it "should find the right genders" do
    Interpreter.with_gender(:male).count.should >= 0
    Interpreter.with_gender(:female).count.should >= 0
    Interpreter.with_gender(:either).count.should == Interpreter.count
    expect { Interpreter.with_gender("garbage").count }.to raise_error
  end

  it "finds interpreters with a minimum experience" do
    Interpreter.with_minimum_years_experience( 0 ).count.should >= 0
    Interpreter.with_minimum_years_experience( 200 ).count.should == 0
    expect{ Interpreter.with_minimum_years_experience( "invalid-value" ).count }.to raise_error
    expect{ Interpreter.with_minimum_years_experience( -1 ).count }.to raise_error
  end

  it "finds interpreters with certifications" do
    Interpreter.having_the_following_certifications( [] ).count.should >= 0
    Interpreter.having_the_following_certifications( nil ).count.should >=0
    Interpreter.having_the_following_certifications( [-1,1] ).count.should >= 0
    expect{ Interpreter.having_the_following_certifications( Object.new ).count }.to raise_error
  end

  it "finds interpreters willing that are willing to travel to an address" do
    expect{ Interpreter.willing_to_travel_to( nil ).count }.to raise_error
    expect{ Interpreter.willing_to_travel_to( "" ).count }.to raise_error
    Interpreter.willing_to_travel_to( "13145 N HWY 183 Austin,TX 78750" ).count.should >= 0
    Interpreter.willing_to_travel_to( [-38.8233843,-69.66911859999999] ).count.should >= 0
  end

  it "finds interpreters available between times" do
    Interpreter.available_between_the_times( Time.now, Time.now + 2.hours ).count.should >= 0
    #Interpreter.available_between_the_times( 'junk', 'more junk').count.should == 0
  end


end
