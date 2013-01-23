class CreatePricingRatePremiums < ActiveRecord::Migration
  def change
    create_table :pricing_rate_premiums do |t|
      t.datetime :effective_date
      t.datetime :end_date
      t.enum :skill
      t.integer :additional_amount
      t.integer :min_increments
      t.integer :pricing_plan_id

      t.timestamps
    end
  end
end
