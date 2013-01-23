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
# @!attribute name
#   @return [String]
#
# @!attribute email
#   @return [String]
#
# @!attribute [w] password
#   @return [String]
#
# @!attribute [w] password_confirmation
#   @return [String]
#
# @!attribute user_type
#   @return [Symbol] either :interpreter or :other
#
class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :user_type

  enum_attr :user_type, %w( ^other interpreter )

  has_one :person
  
  def name
    return self.person.last_first unless self.person.nil?
    return self.email
  end

end
