class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.date :start_date
      t.date :end_date
      t.string :contractable_type
      t.integer :contractable_id

      t.timestamps
    end
  end
end
