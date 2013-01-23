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
# @!attribute contact_label
#   @return [String]
#
# @!attribute contact_type
#   @return [String] enumeration of types :voice, :email, :im, :text
#
# @!attribute contact_value
#   @return [String]
#
# ==== Class Relationships
#
# @!attribute virtual_addressable
#   @return [Person, Client, JobRequest, ReminderTime]
class VirtualAddress < ActiveRecord::Base

  attr_accessible :contact_label, :contact_type, :contact_value

  belongs_to :virtual_addressable, :polymorphic => true

  enum_attr :contact_type, %w( voice email im text pager )


end
