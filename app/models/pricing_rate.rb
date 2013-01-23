# ==== Class Attributes
#
# @!attribute [r] id
#   @return [Integer] unique database id of this address
#
# @!attribute [r] created_at
#   @return [Date] when availability was created
#
# @!attribute [r] updated_at
#   @return [Date] when availability was update
#
# @!attribute pricing_rate_schedule_id
#   @return [Integer]
#
# @!attribute start_time
#   @return [Time]
#
# @!attribute end_time
#   @return [Time]
#
# @!attribute title
#   @return [String]
#
# @!attribute increment_rate
# => the rate per increment_type unit
#   @return [Integer]
#
# @!attribute increment_type
# => the unit to apply to increment_rate
#   @return [String] enumeration of 'minute', 'hour', 'day', 'weekday', 'weekend', 'month', 'year'
#
# @!attribute min_increments
# the minimum increments any billing requires (ie, minimum 1 hr)
#   @return [Integer]
#
# @!attribute overtime_rate
# rate to apply when time has gone over the overtime_threshold
#   @return [Integer]
#
# @!attribute overtime_threshold
# after this number of hours, the overtime_rate then applies
#  @return [Integer]
#
# ==== Class Relationships
#
# @!attribute pricing_rate_schedule
#   @return [pricingRateSchedule]
#
class PricingRate < ActiveRecord::Base

  attr_accessible :title, :effective_date, :end_date, :start_time, :end_time, :day_of_week, :hourly_rate, :min_billing_amount, :overtime_rate, :overtime_threshold

  belongs_to :interpreter

  enum_attr :day_of_week, %w( monday tuesday wednesday thursday friday saturday sunday )
  
  belongs_to :pricing_plan, :class_name => 'PricingPlan'


end
