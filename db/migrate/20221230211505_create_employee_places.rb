class CreateEmployeePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_places do |t|
      t.uuid :id
      t.uuid :employee_id
      t.uuid :department_id
      t.uuid :programminglanguage

      t.timestamps
    end
  end
end
