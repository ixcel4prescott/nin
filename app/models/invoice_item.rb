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
# @!attribute job_date
#   @return [Date]
#
# @!attribute calculation_description
#   @return [String]
#
# @!attribute amount_cents
#   @return [Integer]
#
# ==== Class Relationships
#
# @!attribute job_assignment
#   @return [JobAssignment]
#
# @!attribute billing_plan
#   @return [BillingPlan]
#
# @!attribute contract
#   @return [Contract]
class InvoiceItem < ActiveRecord::Base
  attr_accessible :amount_cents, :calculation_description, :job_date,
      :job_assignment_attributes, :billing_plan_attributes, :contract_attributes, # TODO we may not need these three in the mass setter
      :invoice_item_type

  enum_attr :invoice_item_type, %w( client interpreter )
  monetize :amount_cents
  belongs_to :job_assignment # must have
  belongs_to :billing_plan # must have
  belongs_to :contract # may or may not have a contract
end
