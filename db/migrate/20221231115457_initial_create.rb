class InitialCreate < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :employees, :id => false do |t|
      t.primary_key :uuid, :uuid

      t.text :name, null:false
      t.text :surname, null:false
      t.integer :age, null:false
      t.text :gender, null:false
      t.timestamps
    end

    create_table :departments, :id => false do |t|
      t.primary_key :uuid, :uuid
      t.text :name, null:false
      t.integer :floor, null:false
      t.timestamps
    end

    create_table :programming_languages, :id => false do |t|
      t.primary_key :uuid, :uuid
      t.text :name, null:false
      t.timestamps
    end

    create_table :employee_places, :id => false do |t|
      t.primary_key :uuid, :uuid
      t.timestamps
    end

    add_column :employee_places, :employee_id, :uuid
    add_foreign_key :employee_places, :employees, column: :employee_id, primary_key: "uuid"

    add_column :employee_places, :department_id, :uuid
    add_foreign_key :employee_places, :departments, column: :department_id, primary_key: "uuid"

    add_column :employee_places, :programming_language_id, :uuid
    add_foreign_key :employee_places, :programming_languages, column: :programming_language_id, primary_key: "uuid"
  end
end
