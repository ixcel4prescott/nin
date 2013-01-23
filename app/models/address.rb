# ==== Class Attributes
#
# @!attribute [r] id
#   @return [Integer] unique database id of this address
#
# @!attribute city
#   @return [String] urban area name like Austin, Dallas, New Year... etc
#
# @!attribute state
#   @return [String] country region name like Indiana, Texas... etc
#
# @!attribute street
#   @return [String] first line of a typical address
#
# @!attribute street2
#   @return [String] second line of a typical address, normally something like
#   a suite or apartment number
#
# @!attribute name
#   @return [String] Identifier for the address, when used in an address list / book format
#
# @!attribute room
#   @return [String]
#
# @!attribute zip
#  @return [String] mailing postal code
#
# @!attribute county
#   @return [String] sub state region
#
# @!attribute latitude
#   @return [Float] geo coordinate
#
# @!attribute longitude
#   @return [Float] geo coordinate
#
# @!attribute [r] addressable_type
#   @return [String] the class name and/or relationship that this address belongs to
#
# @!attribute [r] addressable_id
#   @return [Integer] id of the object that the address belongs to
#
# @!attribute [r] created_at
#   @return [Date] when this address was made
#
# @!attribute [r] updated_at
#   @return [Date] last time address was updated
#
# @!attribute address_type
#   @return [String] enumeration descriptor of the address :physical, :mailing, :billing, :schedulable
#
# ==== Class Relationships
#
# @!attribute addressable
#   @return [Person, JobRequest, Client]
#
class Address < ActiveRecord::Base
  attr_accessible :city, :state, :street, :street2, :zip, :county, :latitude, :longitude, :room, :name, :address_type

  # Geo Coding for addresses
  geocoded_by :full_address
  after_validation :geocode

  validates_presence_of :city, :state, :street, :zip

  belongs_to :addressable, :polymorphic => true
  enum_attr :address_type, %w( ^physical mailing billing schedulable )

  def full_address
    "#{street} #{street2} #{city},#{state} #{zip}".squish!
  end
end
