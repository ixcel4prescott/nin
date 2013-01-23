class PaymentMethod < ActiveRecord::Base

  attr_accessible :bank_account, :bank_name, :bank_routing, :payment_type, :paypal_account, :mailing_address, :mas90_id, :mailling_address_attributes

  belongs_to :payable, :polymorphic => true
  
  has_one :mailing_address, :class_name => 'Address', :as => :addressable, :dependent => :destroy, :conditions => { :address_type => :mailing }

  accepts_nested_attributes_for :mailing_address

  enum_attr :payment_type, %w(paypal direct check)
end
