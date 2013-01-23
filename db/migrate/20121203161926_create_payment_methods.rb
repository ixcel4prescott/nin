class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.enum :payment_type
      t.string :paypal_account
      t.string :bank_name
      t.string :bank_routing
      t.string :bank_account
      t.string :mas90_id
      t.string :payable_type
      t.integer :payable_id

      t.timestamps
    end
  end
end
