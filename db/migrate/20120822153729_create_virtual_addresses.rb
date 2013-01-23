class CreateVirtualAddresses < ActiveRecord::Migration
  def change
    create_table :virtual_addresses do |t|
      t.enum :contact_type
      t.string :contact_value
      t.string :contact_label
      t.string :virtual_addressable_type
      t.integer :virtual_addressable_id

      t.timestamps
    end
  end
end
