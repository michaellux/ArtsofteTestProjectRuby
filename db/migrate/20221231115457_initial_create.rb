class InitialCreate < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

<<<<<<< HEAD
    create_table :employees, :id => false do |t|
      t.primary_key :uuid, :uuid

=======
    create_table :employees, id: :uuid do |t|
>>>>>>> 57168a50e9aacf0b7a8b3a9c184f69bd6738c326
      t.text :name, null:false
      t.text :surname, null:false
      t.integer :age, null:false
      t.text :gender, null:false
      t.timestamps
    end

<<<<<<< HEAD
    create_table :departments, :id => false do |t|
      t.primary_key :uuid, :uuid
=======
    create_table :departments, id: :uuid do |t|
>>>>>>> 57168a50e9aacf0b7a8b3a9c184f69bd6738c326
      t.text :name, null:false
      t.integer :floor, null:false
      t.timestamps
    end

<<<<<<< HEAD
    create_table :programming_languages, :id => false do |t|
      t.primary_key :uuid, :uuid
=======
    create_table :programming_languages, id: :uuid do |t|
>>>>>>> 57168a50e9aacf0b7a8b3a9c184f69bd6738c326
      t.text :name, null:false
      t.timestamps
    end

<<<<<<< HEAD
    create_table :employee_places, :id => false do |t|
      t.primary_key :uuid, :uuid
=======
    create_table :employee_places do |t|
      t.uuid :uuid
      t.belongs_to :employee, null:false, foreign_key: true, type: :uuid
      t.belongs_to :department, null:false, foreign_key: true, type: :uuid
      t.belongs_to :programming_language, null:false, foreign_key: true, type: :uuid
>>>>>>> 57168a50e9aacf0b7a8b3a9c184f69bd6738c326
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
