class AddDurationToJobRequest < ActiveRecord::Migration
  def change
    add_column :job_requests, :duration_in_hours, :float
  end
end
