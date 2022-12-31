class Employee < ApplicationRecord
  has_and_belongs_to_many :departments
  has_and_belongs_to_many :programming_languages
end
