class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.uuid :id
      t.text :name
      t.integer :floor

      t.timestamps
    end
  end
end
