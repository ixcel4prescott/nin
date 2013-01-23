class CreatePersonRelationships < ActiveRecord::Migration
  def change
    create_table :person_relationships do |t|
      t.integer :to_organization_id
      t.integer :from_person_id
      t.integer :to_person_id
      t.enum :relationship_type

      t.timestamps
    end
  end
end
