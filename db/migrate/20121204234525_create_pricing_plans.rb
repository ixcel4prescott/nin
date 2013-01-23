class CreatePricingPlans < ActiveRecord::Migration
  def change
    create_table :pricing_plans do |t|
      t.string :title
      t.integer :interpreter_id

      t.timestamps
    end
  end
end
