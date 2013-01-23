class Skill < ActiveRecord::Base
  attr_accessible :skill_type, :where, :experience
  
  belongs_to :interpreter
  
  enum_attr :skill_type, %w(legal medical music theatrical meeting blind_deaf limited_proficiency)
end
