class CreateInterpreterCertifications < ActiveRecord::Migration
  def change
    create_table :interpreter_certifications do |t|
      t.string :certifier
      t.date :start_date
      t.date :end_date
      t.text :comment
      t.string :name
      t.integer :interpreter_id
      t.integer :certification_id

      t.timestamps
    end
  end
end
