class Employee < ApplicationRecord
  has_and_belongs_to_many :departments
  has_and_belongs_to_many :programming_languages

  def self.search(term)
    where("name ILIKE ?", "%#{term}%")
  end
end
