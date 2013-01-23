# ==== Class Attributes
#
# @!attribute [r] id
#   @return [Integer] unique database id of this address
#
# @!attribute day_of_week
#   @return [String] enum string representation of they day of week, monday
#   tuesday, wednesday, thursday, friday, saturday, sunday
#
# @!attribute start_time
#   @return [Time] the clock mark of when the time range starts
#
# @!attribute end_time
#   @return [Time] the clock mark of when the time range ends
#
# @!attribute not_available
#   @return [TrueClass, FalseClass] boolean flag on if this availability time
#   is describing an 'availability' or an 'in-availability'
#
# @!attribute [r] created_at
#   @return [Date] when availability was created
#
# @!attribute [r] updated_at
#   @return [Date] when availability was update
#
# ==== Class Relationships
#
# @!attribute interpreter
#   @return [Interpreter] person this availability belongs to
#
class Availability < ActiveRecord::Base

  attr_accessible :day_of_week, :end_time, :exception_date, :not_available, :start_time

  belongs_to :interpreter

  enum_attr :day_of_week, %w( monday tuesday wednesday thursday friday saturday sunday )

end
