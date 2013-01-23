class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :prefix_name
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :postfix_name
      t.string :preferred_language
      t.string :written_languages
      t.string :spoken_languages
      t.enum :gender
      t.date :dob
      t.integer :user_id


      t.timestamps
    end
  end
end
