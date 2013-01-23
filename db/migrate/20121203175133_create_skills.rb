class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.enum :skill_type
      t.float :experience
      t.string :where
      t.integer :interpreter_id

      t.timestamps
    end
  end
end
