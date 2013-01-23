class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :comment
      t.string :visibility
      t.string :notable_type
      t.integer :notable_id

      t.timestamps
    end
  end
end
