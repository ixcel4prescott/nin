class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :from_person_id
      t.integer :to_person_id
      t.integer :to_organization_id
      
      t.enum :relationship_type

      t.timestamps
    end
  end
end
