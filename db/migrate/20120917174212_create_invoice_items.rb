class CreateInvoiceItems < ActiveRecord::Migration
  def change
    create_table :invoice_items do |t|
      t.date :job_date
      t.string :calculation_description
      t.string :invoice_item_type
      t.integer :amount_cents
      t.integer :job_assignment_id
      t.integer :billing_plan_id
      t.integer :contract_id

      t.timestamps
    end
  end
end
