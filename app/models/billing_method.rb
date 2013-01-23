class BillingMethod < ActiveRecord::Base
  attr_accessible  :billing_type, :billing_address, :cc_number, :cc_ccv, :cc_exp, :billing_name, :mas90_id

  belongs_to :billable, :polymorphic => true
  
  has_one :billing_address, :class_name => 'Address', :as => :addressable, :dependent => :destroy, :conditions => { :address_type => :billing }

  enum_attr :billing_type, %w(invoice cc)
end