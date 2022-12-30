class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.uuid :id
      t.text :name
      t.text :surname
      t.integer :age
      t.text :gender

      t.timestamps
    end
  end
end
