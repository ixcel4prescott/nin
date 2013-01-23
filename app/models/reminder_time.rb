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
# @!attribute acknowledged_time
#   @return [Date]
#
# @!attribute alert_time
#   @return [Date]
#
# @!attribute sent_time
#   @return [Date]
#
# @!attribute reminder_id
#   @return [Integer]
#
# ==== Class Relationships
#
# @!attribute reminder
#   @return [Reminder]
#
# @!attribute virtual_address
#   @return [VirtualAddress]
#
class ReminderTime < ActiveRecord::Base
  attr_accessible :acknowledged_time, :alert_time, :sent_time, :virtual_address, :reminder
  
  belongs_to :reminder
  has_one :virtual_address, :class_name => "VirtualAddress", :as => :virtual_addressable
end
