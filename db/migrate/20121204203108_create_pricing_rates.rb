class CreatePricingRates < ActiveRecord::Migration
  def change
    create_table :pricing_rates do |t|
      t.string :title
      t.datetime :effective_date
      t.datetime :end_date
      t.integer :hourly_rate
      t.time :start_time
      t.time :end_time
      t.enum :day_of_week
      t.integer :min_billing_amount
      t.integer :overtime_threshold
      t.integer :overtime_rate
      t.integer :pricing_plan_id

      t.timestamps
    end
  end
end
