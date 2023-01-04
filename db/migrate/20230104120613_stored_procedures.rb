class StoredProcedures < ActiveRecord::Migration[7.0]
  def change
     execute File.read(File.expand_path('../../stored_procedures/dbo.DeleteEmployeePlace.sql', __FILE__))
  end
end
