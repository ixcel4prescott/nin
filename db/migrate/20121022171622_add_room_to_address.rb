class AddRoomToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :room, :string
  end
end
