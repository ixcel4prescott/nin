class IntegrateInterpreterToPerson < ActiveRecord::Migration

  def up
    drop_table :interpreters
  end

  def down
    create_table :interpreters do |t|
      t.enum :gender
      t.string :first_name
      t.string :middle_initial
      t.string :last_name
      t.datetime :start_date
      t.text :comments
      t.string :email_address
      t.integer :certification_level
      t.text :languages
      t.integer :max_travel

      t.timestamps
    end
  end

end
