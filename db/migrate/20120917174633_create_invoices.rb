class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.date :period_start
      t.date :period_end
      t.string :reference
      t.enum :invoice_type
      t.integer :contract_id
      t.integer :invoiceable_id
      t.string :invoiceable_type

      t.timestamps
    end
  end
end
