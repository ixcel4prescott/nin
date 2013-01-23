class CreateJobAssignments < ActiveRecord::Migration
  def change
    create_table :job_assignments do |t|
      t.enum :status
      t.datetime :scheduled_start
      t.datetime :estimated_end
      t.datetime :actual_start
      t.datetime :actual_end
      t.integer :client_billing_plan_id
      t.integer :interpreter_billing_plan_id
      t.integer :client_id
      t.integer :interpreter_id
      t.integer :job_request_id
      t.integer :client_invoice_id
      t.integer :interpreter_invoice_id

      t.timestamps
    end
  end
end
