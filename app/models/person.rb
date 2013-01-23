# ==== Class Attributes
#
# @!attribute [r] id
#   @return [Integer] unique database id of this address
#
# @!attribute dob
#   @return [Date] date of birth
#
# @!attribute first_name
#   @return [String]
#
# @!attribute gender
#   @return [String] enumeration of either 'male' or 'female'
#
# @!attribute last_name
#   @return [String]
#
# @!attribute middle_name
#   @return [String]
#
# @!attribute postfix_name
#   @return [String]
#
# @!attribute preferred_language
#   @return [String]
#   @todo this is free form, should make it an enumeration ?
#
# @!attribute prefix_name
#   @return [String]
#
# @!attribute user_id
#   @return [Integer] unique id of the user, if any, that this person is bound to
#
# @!attribute [r] created_at
#   @return [Date] when this address was made
#
# @!attribute [r] updated_at
#   @return [Date] last time address was updated
#
# @!attribute type
#   @return [String] Used by the rails model to determine inheritance selects on models that extend Person
#
# ==== Class Relationships
#
# @!attribute physical_address
#   @return [Array<Address>]
#
# @!attribute virtual_addresses
#   @return [Array<VirtualAddress>]
#
# @!attribute user
#   @return [User, NilClass]

class Person < ActiveRecord::Base

  attr_accessible :dob, :first_name, :gender, :last_name, :middle_name, :postfix_name, :preferred_language, :prefix_name
  
  has_one :mailing_address, :class_name => 'Address', :as => :addressable, :dependent => :destroy, :conditions => { :address_type => :mailing }
  
  has_many :virtual_addresses, :class_name => 'VirtualAddress', :as => :virtual_addressable, :dependent => :destroy
  has_many :emails, :class_name => 'VirtualAddress', :as => :virtual_addressable, :conditions => { :contact_type => :email }

  accepts_nested_attributes_for :mailing_address, :virtual_addresses
  attr_accessible :mailing_address_attributes, :virtual_addresses_attributes, :user_id
  
  serialize :virtual_addresses_attributes

  belongs_to :user

  enum_attr :gender, %w(male female)

  validates :last_name,  :presence => true
  validates :first_name, :presence => true

  # @return [String] combines the first, middle, and last names and any prefix or postfix names
  def full_name
    "#{self.prefix_name} #{self.first_name} #{self.middle_name} #{self.last_name} #{self.postfix_name}".squish!
  end

  # @return [String] returns a formatted string with the last name
  def last_first
    "#{self.last_name}, #{self.first_name} #{self.middle_name}".squish!
  end
  
  def email
    return self.user.email unless (self.user.nil? || self.user.email.empty?)
    return self.emails[0] unless (self.emails.nil || self.emails.empty?)
  end

end
