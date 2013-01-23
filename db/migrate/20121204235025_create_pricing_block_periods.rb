class CreatePricingBlockPeriods < ActiveRecord::Migration
  def change
    create_table :pricing_block_periods do |t|
      t.datetime :effective_date
      t.datetime :end_date
      t.time :start_time
      t.time :end_time
      t.enum :day_of_week
      t.integer :pricing_plan_id

      t.timestamps
    end
  end
end
