# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "securerandom"

employee_id = SecureRandom.uuid
department_id = SecureRandom.uuid
programming_language_id = SecureRandom.uuid
employee_place_id = SecureRandom.uuid
Employee.create(id: employee_id, name: "Helga", surname: "Watson", age: 32, gender: "Female")
Department.create(id: department_id, name: "First", floor: 1)
ProgrammingLanguage.create(id: programming_language_id, name: "Fortran")
EmployeePlace.create(
  uuid: employee_place_id, 
  employee_id: employee_id, 
  department_id: department_id, 
  programming_language_id: programming_language_id)

