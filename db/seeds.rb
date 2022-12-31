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

Department.create(id: department_id, name: "First", floor: 1)
ProgrammingLanguage.create(id: programming_language_id, name: "Fortran")

