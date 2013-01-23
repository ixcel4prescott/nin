# ==== Class Attributes
#
# @!attribute [r] id
#   @return [Integer] unique database id of this address
#
# @!attribute [r] created_at
#   @return [Date] when this address was made
#
# @!attribute [r] updated_at
#   @return [Date] last time address was updated
#
# @!attribute billable_plan_id
#   @return [Integer]
#
# @!attribute billable_plan_type
#   @return [String]
#
# @!attribute title
#   @return [String]
#
# ==== Class Relationships
#
# @!attribute pricing_rate_schedules
#   @return [Array<pricingRateSchedule>]
#
# @!attribute billable_plan
#   @return [Contract]
#
# @!attribute interpreter
#   @return Interpreter
class PricingPlan < ActiveRecord::Base

  #rates effective from effective_date to end_date
  has_many :pricing_rates, :dependent => :destroy
  
  has_many :pricing_rate_premiums, :dependent => :destroy
  
  #periods of time that are blocked - no rate = no availability
  has_many :pricing_block_periods, :dependent => :destroy

  accepts_nested_attributes_for :pricing_rates, :pricing_rate_premiums, :pricing_block_periods

  belongs_to :interpreter

  attr_accessible :title, :pricing_rates_attributes, :pricing_rate_premiums_attributes, :pricing_block_periods_attributes

  def self.available_during( starting, ending )
    joins( :pricing_rates )
    .joins( :pricing_block_periods )
    .where("pricing_block_periods.effective_date < :starting", :starting=>starting )
    .where("pricing_block_periods.end_date IS NULL OR pricing_block_periods.end_date < :ending", :ending=>ending )
    .where("pricing_block_periods.day_of_week = :week_day", :week_day=>extract_day(starting) )
    .where("pricing_block_periods.start_time <= :start_time", :start_time=>extract_time(starting) )
    .where("pricing_block_periods.end_time >= :end_time", :end_time=>extract_time(ending) )

  end

  private

  def self.extract_day( date )
    date.strftime('%A').downcase!
  end

  def self.extract_time( date )
    Time.at( date.hour.hours + date.min.minutes + date.sec.seconds ).utc
  end


end
