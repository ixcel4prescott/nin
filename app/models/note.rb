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
# @!attribute comment
#   @return [String]
#
# @!attribute visibility
#   @return [String] enum of four options 'call_center', 'interpreter', 'client', 'all'
#
# @!attribute notable_id
#   @return [Integer] foreign key to which the note belongs
#
# @!attribute notable_type
#   @return [String] object table that the foreign key points to
#
# ==== Class Relationships
#
# @!attribute notable
#   @return [Client,Contract,Interpreter]
#
class Note < ActiveRecord::Base

  attr_accessible :comment, :notable_id, :notable_type, :visibility

  belongs_to :notable, :polymorphic => true, :dependent => :destroy

  enum_attr :visibility, %w( call_center interpreter client all )  # should really be a hash or bit representation

end
