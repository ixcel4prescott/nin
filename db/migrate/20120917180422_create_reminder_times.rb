class CreateReminderTimes < ActiveRecord::Migration
  def change
    create_table :reminder_times do |t|
      t.datetime :alert_time
      t.datetime :sent_time
      t.datetime :acknowledged_time
      t.integer :reminder_id

      t.timestamps
    end
  end
end
