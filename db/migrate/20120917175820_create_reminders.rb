class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.enum :reminder_type
      t.string :notification
      t.integer :job_assignment_id
      t.integer :person_id

      t.timestamps
    end
  end
end
