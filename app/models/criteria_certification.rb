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
# @!attribute certification_id
#   @return [Integer]
#
# @!attribute job_criteria_id
#   @return [Integer]
#
# @!attribute required
#   @return [TrueClass,FalseClass] specifies if the criteria is a "need" or "want"
#
# ==== Class Relationships
#
# @!attribute certification
#   @return [Certification]
#
# @!attribute job_criteria
#   @return [JobCriteria]
class CriteriaCertification < ActiveRecord::Base

  validate :only_instance?

  attr_accessible :required

  belongs_to :certification

  belongs_to :job_criteria

  # The same certification cannot exist for a job criteria twice
  def only_instance?
    if new_record? && CriteriaCertification.where( :job_criteria_id => job_criteria_id, :certification_id => certification_id ).count > 0
      errors[:base] << "You may not define the same JobCriteria <==> Certification Twice"
    elsif not new_record? and ( job_criteria_id_changed? or certification_id_changed? )
      errors[:base] << "JobCriteria <==> Certification relationship may not be remapped"
    end
  end

end
