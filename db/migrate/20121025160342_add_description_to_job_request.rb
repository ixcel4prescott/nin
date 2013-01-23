class AddDescriptionToJobRequest < ActiveRecord::Migration
  def change
    add_column :job_requests, :description, :text, :default => ""
  end
end
