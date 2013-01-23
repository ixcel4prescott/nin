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
# @!attribute contract_id
#   @return [Integer]
#
# @!attribute invoice_type
#   @return [String] either "client" or "interpreter"
#
# @!attribute invoiceable_type
#   @return [String] class that the foreign key references
#
# @!attribute invoiceable_id
#   @return [Integer]
#
# @!attribute period_start
#   @return [Date]
#
# @!attribute period_end
#   @return [Date]
#
# @!attribute reference
#   @return [String]
#
# ==== Class Attributes
#
# @!attribute job_assignments
#   @return [Array<JobAssignment>]
#
# @!attribute contract
#   @return [Contract]
#
# @!attribute invoiceable
#   @return [JobAssignment]
#
class Invoice < ActiveRecord::Base
  attr_accessible :invoice_type, :period_end, :period_start, :reference, :job_assignments, :contract

  belongs_to :invoiceable, :polymorphic => true
  
  enum_attr :invoice_type, %w(client interpreter)
  has_many :job_assignments
  belongs_to :contract
end
