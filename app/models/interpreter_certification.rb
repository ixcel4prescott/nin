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
# @!attribute certification_id
#   @return [Integer]
#
# @!attribute certifier
#   @return [String] free form text field describing the authoritative body providing the certification
#
# @!attribute comment
#   @return [String] additional free form text field
#
# @!attribute end_date
#   @return [Time] when the certification expires
#
# @!attribute start_time
#   @return [Time] when the certification begins
#
# ==== Class Relationships
#
# @!attribute certification_id
#   @return []
#
# @!attribute interpreter_id
#   @return []

class InterpreterCertification < ActiveRecord::Base

  attr_accessible :start_date, :end_date, :comment, :certifier, :interpreter, :name, :certification_id

  belongs_to :certification
  belongs_to :interpreter

  scope :active, where( 'end_date > :time AND start_date < :time', time: DateTime.now.beginning_of_day )

  def name
    if super && !super.empty?
      super
    else
      certification.name
    end
  end

  def name=(name)
    match =  Certification.find_by_name(name)
    if match
      self.certification_id = match.id
      super
    else
      self.certification_id = nil
      super
    end
  end

end
