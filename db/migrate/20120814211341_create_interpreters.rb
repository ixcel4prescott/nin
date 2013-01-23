class CreateInterpreters < ActiveRecord::Migration
  def change
    create_table :interpreters do |t|
      t.enum :gender
      t.string :first_name
      t.string :middle_initial
      t.string :last_name
      t.integer :address_id
      t.datetime :start_date
      t.text :comments
      t.string :email_address
      t.integer :certification_level
      t.text :languages

      t.timestamps
    end
  end
end
