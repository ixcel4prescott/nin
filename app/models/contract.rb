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
# @!attribute contractable_id
#   @return [Integer] foreign key
#
# @!attribute contractable_type
#   @return [String] class that owns the foreign key
#
# @!attribute start_date
#   @return [Date] when the contract begins
#
# @!attribute end_date
#   @return [Date] when the contract ends
#
# ==== Class Relationships
#
# @!attribute contractable
#   @return [Client,Interpreter]
#
# @!attribute notes
#   @return [Array<Note>]
#
# @!attribute billing_plan
#   @return [BillingPlan]
class Contract < ActiveRecord::Base

  # TODO what is the reference field? it's not in the migrations or schema
  attr_accessible :end_date, :start_date, :reference

  belongs_to :contractable, :polymorphic => true

  has_many :notes, :class_name => 'Note', :as => :notable

  has_one :billing_method, :class_name => 'BillingMethod', :as => :billable, :dependent => :destroy

end
