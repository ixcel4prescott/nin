class CreateCriteriaSkills < ActiveRecord::Migration
  def change
    create_table :criteria_skills do |t|
      t.integer :job_request_id
      t.enum :skill_type
      
      t.timestamps
    end
  end
end
