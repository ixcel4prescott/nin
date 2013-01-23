class AddScheduledAddressIdToJobRequest < ActiveRecord::Migration
  def change
    add_column :job_requests, :address_id, :integer
  end
end
