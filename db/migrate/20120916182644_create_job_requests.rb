class CreateJobRequests < ActiveRecord::Migration
  def change
    create_table :job_requests do |t|
      t.enum :request_type
      t.enum :request_status
      t.datetime :start_datetime
      t.enum :recurring
      t.integer :client_id
      t.string :name
      t.string :reference
      t.datetime :start_window
      t.integer :estimated_period
      t.integer :period_window
      t.integer :hourly_max_cents
      t.integer :total_max_cents
      t.enum :gender_range
      t.enum :job_type
      t.integer :percent_interpreting
      t.integer :services_for_id
      t.integer :onsite_contact_id
      
      t.timestamps
    end
  end
end
