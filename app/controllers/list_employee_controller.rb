require "active_support/core_ext/digest/uuid"
require "securerandom"
class ListEmployeeController < ApplicationController
  def add
    @employee = Employee.new
    @employee_places = EmployeePlace.new
  end

  def create
    employee_params_modified = employee_params;
<<<<<<< HEAD
    employee_params_modified[:uuid] = SecureRandom.uuid
    @employee = Employee.create(employee_params_modified)
    
    employee_places_converted_params = Hash.new
    employee_places_converted_params[:uuid] = SecureRandom.uuid
    employee_places_converted_params[:employee_id] = employee_params_modified[:uuid]
    employee_places_converted_params[:department_id] = Digest::UUID.uuid_v5(employee_places_params[:department], "department_id")
    employee_places_converted_params[:programming_language_id] = Digest::UUID.uuid_v5(employee_places_params[:programming_language], "programming_language_id")
    puts "-------------employee_place"
=======
    employee_params_modified[:id] = SecureRandom.uuid
    @employee = Employee.create(employee_params_modified)
    
    employee_places_converted_params = Hash.new
    employee_places_converted_params[:id] = SecureRandom.uuid
    employee_places_converted_params[:employee_id] = employee_params_modified[:id]
    employee_places_converted_params[:department_id] = Digest::UUID.uuid_v5(employee_places_params[:department], "department_id")
    employee_places_converted_params[:programming_language_id] = Digest::UUID.uuid_v5(employee_places_params[:programming_language], "programming_language_id")
>>>>>>> 57168a50e9aacf0b7a8b3a9c184f69bd6738c326
    puts employee_places_converted_params
    @employee_place = EmployeePlace.create(employee_places_converted_params)

    if @employee.save && @employee_place.save
      redirect_to root_path
    end
  end

  def employee_params
    params.require(:employee).permit(
      :name, :surname, :age, :gender
    )
  end

  def employee_places_params
    params.require(:employee).permit(
      :department, :programming_language
    )
  end
end