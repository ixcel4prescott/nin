class CriteriaSkill < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :job_request, :skill_type

  belongs_to :job_request
  enum_attr :skill_type, %w(legal medical music theatrical meeting blind_deaf limited_proficiency)
end
