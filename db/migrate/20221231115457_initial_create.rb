class InitialCreate < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :employees, id: :uuid do |t|
      t.text :name, null:false
      t.text :surname, null:false
      t.integer :age, null:false
      t.text :gender, null:false
      t.timestamps
    end

    create_table :departments, id: :uuid do |t|
      t.text :name, null:false
      t.integer :floor, null:false
      t.timestamps
    end

    create_table :programming_languages, id: :uuid do |t|
      t.text :name, null:false
      t.timestamps
    end

    create_table :employee_places do |t|
      t.uuid :uuid
      t.belongs_to :employee, null:false, foreign_key: true, type: :uuid
      t.belongs_to :department, null:false, foreign_key: true, type: :uuid
      t.belongs_to :programming_language, null:false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
