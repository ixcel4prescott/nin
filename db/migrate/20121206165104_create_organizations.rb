class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :formal_name
      t.enum :org_type
      
      
      t.timestamps
    end
  end
end
