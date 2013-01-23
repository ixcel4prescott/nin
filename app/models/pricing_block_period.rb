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
# @!attribute date_from
#   @return [Date] start date of the schedule
#
# @!attribute date_to
#   @return [Date] end date of the schedule
#
# ==== Class Relationships
#
# @!attribute pricing_rate
#   @return [pricingRate]
class PricingBlockPeriod < ActiveRecord::Base

  attr_accessible :effective_date, :end_date, :start_time, :end_time, :day_of_week

  belongs_to :pricing_plan, :class_name => 'PricingPlan'

  enum_attr :day_of_week, %w( monday tuesday wednesday thursday friday saturday sunday )
end
