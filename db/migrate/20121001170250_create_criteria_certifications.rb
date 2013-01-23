class CreateCriteriaCertifications < ActiveRecord::Migration
  def change
    create_table :criteria_certifications do |t|
      t.integer :job_criteria_id
      t.integer :certification_id
      t.boolean :required

      t.timestamps
    end
  end
end
