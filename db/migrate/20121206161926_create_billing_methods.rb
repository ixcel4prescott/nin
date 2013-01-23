class CreateBillingMethods < ActiveRecord::Migration
  def change
    create_table :billing_methods do |t|
      t.enum :billing_type
      t.string :cc_number
      t.string :cc_ccv
      t.string :billing_name
      t.string :cc_exp
      t.string :mas90_id
      t.string :billable_type
      t.integer :billable_id

      t.timestamps
    end
  end
end
