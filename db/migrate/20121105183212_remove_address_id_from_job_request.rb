class RemoveAddressIdFromJobRequest < ActiveRecord::Migration
  def change
    remove_column :job_requests, :address_id
  end
end
