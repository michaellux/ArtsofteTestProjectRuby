class EmployeePlace < ApplicationRecord
  belongs_to :employee, primary_key: :uuid
  belongs_to :department, primary_key: :uuid
  belongs_to :programming_language, primary_key: :uuid
end
