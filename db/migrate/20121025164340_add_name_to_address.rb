class AddNameToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :name, :string, :default => ""
  end
end
