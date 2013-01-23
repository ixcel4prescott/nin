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
# @!attribute mas90_id
#   @return [String] foreign key to an external accounting system
#
# ==== Class Relationships
#
#
# @!attribute notes
#   @return [Array<Note>]
#
# @!attribute contracts
#   @return [Array<Contract>]
#
# @!attribute mailing_address
#   @return [Address]
#
# @!attribute billing_address
#   @return [Address]
#
# @!attribute virtual_address
#   @return [Array<VirtualAddress>] types of communication identification such as voice, email, im, and text
#
class Client < Person

  has_one :billing_method, :class_name => 'BillingMethod', :as => :billable, :dependent => :destroy

  belongs_to :organization, :class_name => 'Organization', :inverse_of => :clients

  has_many :job_requests

  has_many :notes, :class_name => 'Note', :as => :notable, :dependent => :destroy

  has_many :schedulable_locations, :class_name => 'Address', :as => :addressable, :dependent => :destroy, :conditions => { :address_type => :schedulable }


  def has_exactly_one_organization?
    organizations.count == 1
  end

  # # Making sure the type is set correctly on assignment
  # def mailing_address=( address )
  # address.address_type=( 'mailing' ) if address.respond_to? :address_type=
  # super( address )
  # end

end
