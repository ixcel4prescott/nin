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
# @!attribute billing_rate_schedule_id
#   @return [Integer]
#
# @!attribute skill
#   @return [String]
#
# @!attribute increment_rate
#   @return [Integer]
#
# @!attribute increment_type
#   @return [String] enumeration of 'minute', 'hour', 'day', 'weekday', 'weekend', 'month', 'year'
#
# @!attribute min_increments
#   @return [Integer]
#
# ==== Class Relationships
#
# @!attribute billing_rate_schedule
#   @return [BillingRateSchedule]
#
class PricingRatePremium < ActiveRecord::Base

  attr_accessible :effective_date, :end_date, :skill, :min_increments, :additional_amount

  belongs_to :pricing_plan, :class_name => 'PricingPlan'

  enum_attr :skill, %w(legal medical music theatrical meeting blind_deaf limited_proficiency)

end
