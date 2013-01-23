class Organization < ActiveRecord::Base

  resourcify

  attr_accessible :formal_name, :name, :org_type
  
  enum_attr :org_type, %w(Medical, Legal, Education, Government, Other)

  has_one :billing_method, :class_name => 'BillingMethod', :as => :billable, :dependent => :destroy

  has_many :clients, :class_name => 'Client', :inverse_of => :organization

  has_many :contracts, :class_name => 'Contract', :as => :contractable
  
  has_one :mailing_address, :class_name => 'Address', :as => :addressable, :dependent => :destroy, :conditions => { :address_type => :mailing }

  has_many :schedulable_locations, :class_name => 'Address', :as => :addressable, :dependent => :destroy, :conditions => { :address_type => :schedulable }
        has_many :notes, :class_name => 'Note', :as => :notable, :dependent => :destroy

  # Making sure the type is set correctly on assignment
  def mailing_address=( address )
    address.address_type=( 'mailing' ) if address.respond_to? :address_type=
    super( address )
  end
  
end
