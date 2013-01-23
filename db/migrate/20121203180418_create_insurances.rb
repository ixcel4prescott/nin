class CreateInsurances < ActiveRecord::Migration
  def change
    create_table :insurances do |t|
      t.string :carrier
      t.string :account
      t.integer :coverage
      t.integer :interpreter_id
      t.string :insurance_proof

      t.timestamps
    end
  end
end
