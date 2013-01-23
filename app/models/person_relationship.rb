class PersonRelationship < ActiveRecord::Base

  attr_accessible :from_person, :to_person, :to_organization, :relationship_type
  
  belongs_to :from_person, :class_name => 'Person'
  belongs_to :to_person, :class_name => 'Person'
  belongs_to :to_organization, :class_name => 'Organization'
  
  enum_attr :relationship_type, %w(blacklist preferred)
  
  def person_relationship?
    return !self.to_person.nil?
  end
  
  def organization_relationship?
    return !self.to_organization.nil?
  end
  
  def person_or_organization
    self.to_person || self.to_organization
  end
end