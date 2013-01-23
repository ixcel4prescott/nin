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
# @!attribute status
#   @return [String] "pending", "completed", "cancelled"
#
# @!attribute scheduled_start
#   @return [Date]
#
# @!attribute estimated_end
#   @return [Date]
#
# @!attribute actual_start
#   @return [Date]
#
# @!attribute actual_end
#   @return [Date]
#
# @!attribute client_billing_plan_id
#   @return [Integer]
#
# @!attribute interpreter_billing_plan_id
#   @return [Integer]
#
# @!attribute client_id
#   @return [Integer]
#
# @!attribute interpreter_id
#   @return [Integer]
#
# @!attribute job_request_id
#   @return [Integer]
#
# ==== Class Relationships
#
# @!attribute client
#   @return [Client]
#
# @!attribute interpreter
#   @return [Interpreter]
#
# @!attribute job_request
#   @return [JobRequest]
#
# @!attribute client_billing_plan
#   @return [BillingPlan]
#
# @!attribute interpreter_billing_plan
#   @return [BillingPlan]
class JobAssignment < ActiveRecord::Base
  attr_accessible :actual_end, :actual_start, :estimated_end, :scheduled_start,
                  :status, :client, :interpreter, :job_request, :client_billing_plan, :interpreter_billing_plan

  enum_attr :status, %w(pending, completed, cancelled)
  belongs_to :client
  belongs_to :interpreter
  belongs_to :job_request

  belongs_to :client_billing_plan, :class_name => "BillingPlan", :foreign_key => "client_billing_plan_id" # must have
  belongs_to :interpreter_billing_plan, :class_name => "BillingPlan", :foreign_key => "interpreter_billing_plan_id" # must have

  has_many :invoice_items
  has_many :interpreter_invoice_items, :through => 'invoice_items', :conditions => { :invoice_item_type => :interpreter }
  has_many :client_invoice_items, :through => 'invoice_items', :conditions => { :invoice_item_type => :client }

  belongs_to :interpreter_invoice, :class_name => "Invoice", :dependent => :destroy, :foreign_key => "interpreter_invoice_id"
  belongs_to :client_invoice, :class_name => "Invoice", :dependent => :destroy, :foreign_key => "client_invoice_id"
end
