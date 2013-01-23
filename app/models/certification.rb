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
# @!attribute certifiable_id
#   @return [Integer]
#
# @!attribute certification
#   @return [String] free form text field describing the certification
#
#
class Certification < ActiveRecord::Base

  attr_accessible :name

  has_many :interpreter_certifications

end
