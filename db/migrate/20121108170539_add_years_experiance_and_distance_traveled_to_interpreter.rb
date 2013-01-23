class AddYearsExperianceAndDistanceTraveledToInterpreter < ActiveRecord::Migration
  def change
    add_column :people, :years_experience, :float, :default => nil
    add_column :people, :miles_willing_to_travel, :integer, :default => nil
  end
end
