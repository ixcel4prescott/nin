class AddTypeToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :address_type, :string, :default => "physical"
  end
end
