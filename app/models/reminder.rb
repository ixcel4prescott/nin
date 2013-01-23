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
# @!attribute notification
#   @return [String]
#
# @!attribute reminder_type
#   @return [String]
#
# @!attribute job_assignment_id
#   @return [Integer]
#
# @!attribute person_id
#   @return [Integer]
#
# ==== Class Relationships
#
# @!attribute person
#   @return [Person]
#
# @!attribute job_assignment
#   @return [JobAssignment]
#
# @!attribute reminder_times
#   @return [Array<ReminderTime>]
#
class Reminder < ActiveRecord::Base
  attr_accessible :notification, :reminder_type, :reminder_times, :job_assignment, :person
  
  has_many :reminder_times
  belongs_to :job_assignment
  belongs_to :person
  
end
