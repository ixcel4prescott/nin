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
# @!attribute recurring
#   @return [String] describes the frequency of which the request will happen, options are 'none', 'daily', 'weekly',
#   'biweekly', 'monthly', 'quarterly', 'yearly'
#
# @!attribute request_status
# => when request is first created, it is in 'unfilled' state.
# => when payment approval is done, request should be moved to 'pending' state and sent off to interpreters
# => when an interpreter is associated with the request, it should be moved to a 'filled' state and no longer available for filling.  Confirmation emails should be sent to client and terp
# => when both client and terp confirm the assignment, then request should be moved into a 'confirmed' state and a JobAssignment created.
#   @return [String] flag detailing where in the process the request is, options are 'unfilled', 'pending', 'filled', 'confirmed'
#
# @!attribute request_type
#   @return [String] options are 'site', 'vri'
#
# @!attribute start_datetime
#   @return [Date]
#
# @!attribute client_id
#   @return [Integer] foreign key for the Client to whom this job request belongs to
#
# @!attribute name
#   @return [String]
#
# @!attribute reference
#   @return [String] used by client to attach a reference id for their own records
#
# @!attribute start_window
#   @return [Date]
#
# @!attribute estimated_period
#   @return [Integer]
#
# @!attribute period_window
#   @return [Integer]
#
# @!attribute hourly_max_cents
#   @return [Integer]
#
# @!attribute total_max_cents
#   @return [Integer]
#
# @!attribute gender_range
#   @return [String] enum of three selections 'any', 'male', 'female'
#
# ==== Class Relationships
#
# @!attribute client
#   @return [Client]
#
# @!attribute physical_address
#   @return [Address]
#
# @!attribute virtual_address
#   @return [VirtualAddress]
#
# @!attribute criteria_certifications_desired
#   @return [Array<CriteriaCertification>]  non-required certification criteria
#
# @!attribute criteria_certifications_required
#   @return [Array<CriteriaCertification>] Criteria that must be held by an interpreter for the job_request
#
# @!attribute certifications_desired
#   @return [Array<Certification>]
#
# @!attribute certifications_required
#   @return [Array<Certification>]
class JobRequest < ActiveRecord::Base

  # TODO the client, physical_address, and virtual_address accessors may need to be nuked and refitted with nested workers
  attr_accessible :recurring, :request_status, :request_type, :start_datetime, :client, :physical_address, :virtual_address, :name, :reference, :description
  attr_accessible :estimated_period, :gender_range, :hourly_max_cents, :period_window, :start_window, :total_max_cents
  attr_accessible :job_type, :percent_interpreting, :services_for, :onsite_contact
  attr_accessible :physical_address_attributes, :services_for_attributes, :onsite_contact_attributes, :client_id
  
  belongs_to :client
  belongs_to :services_for, :class_name => 'Person'
  belongs_to :onsite_contact, :class_name => 'Person'
  
  # For onsite
  has_one :physical_address, :class_name => 'Address', :as => :addressable
  # For VRI
  has_one :virtual_address, :class_name => 'VirtualAddress', :as => :virtual_addressable
 

  has_many :criteria_certifications_desired, :class_name => 'CriteriaCertification', :conditions => { :required => false }

  has_many :criteria_certifications_required, :class_name => 'CriteriaCertification', :conditions => { :required => true }

  has_many :certifications_desired, :through => :criteria_certifications_desired, :source => :certification

  has_many :certifications_required, :through => :criteria_certifications_required, :source => :certification

  has_many :criteria_skills, :class_name => 'CriteriaSkill'
  
  has_many :attachments, :as => :attachable
  
  monetize :hourly_max_cents
  monetize :total_max_cents
  
  accepts_nested_attributes_for :physical_address, :services_for, :onsite_contact
  
  enum_attr :gender_range, %w(any, male, female)
  enum_attr :request_status, %w(unfilled pending filled confirmed) # on confirmed it should kick off an assignment
  enum_attr :request_type, %w(site vri)
  enum_attr :recurring, %w(none daily weekly biweekly monthly quarterly yearly)
  
end
