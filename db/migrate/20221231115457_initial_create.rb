class InitialCreate < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'

    create_table :employees, id: :uuid do |t|
      t.text :name
      t.text :surname
      t.integer :age
      t.text :gender
      t.timestamps
    end

    create_table :departments, id: :uuid do |t|
      t.text :name
      t.integer :floor
      t.timestamps
    end

    create_table :programming_languages, id: :uuid do |t|
      t.text :name
      t.timestamps
    end

    create_table :employee_places, id: :uuid do |t|
      t.belongs_to :employee, type: :uuid
      t.belongs_to :department, type: :uuid
      t.belongs_to :programming_language, type: :uuid
      t.timestamps
    end
  end
end
