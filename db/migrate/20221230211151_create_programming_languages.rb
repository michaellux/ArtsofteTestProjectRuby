class CreateProgrammingLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :programming_languages do |t|
      t.uuid :id
      t.text :name
      t.integer :floor

      t.timestamps
    end
  end
end
