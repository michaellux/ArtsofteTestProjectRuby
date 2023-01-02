require "active_support/core_ext/digest/uuid"
require "securerandom"
class ListEmployeeController < ApplicationController
  def add
    @employee = Employee.new
    @employee_place = EmployeePlace.new
  end

  def create
    employee_params_modified = employee_params;
    employee_params_modified[:uuid] = SecureRandom.uuid
    @employee = Employee.create(employee_params_modified)

    @employee_place = EmployeePlace.transaction do
      begin
        employee_places_converted_params = Hash.new
        employee_places_converted_params[:uuid] = SecureRandom.uuid
        employee_places_converted_params[:employee_id] = employee_params_modified[:uuid]
        employee_places_converted_params[:department_id] = employee_places_params[:department]
        employee_places_converted_params[:programming_language_id] = employee_places_params[:programming_language]
        EmployeePlace.create(
          uuid: employee_places_converted_params[:uuid],
              employee_id: employee_places_converted_params[:employee_id],
              department_id: employee_places_converted_params[:department_id],
              programming_language_id: employee_places_converted_params[:programming_language_id],
        )

      rescue StandardError => e
        Rails.logger.info("Transaction failed with a message #{e.message}")
        raise ActiveRecord::Rollback, e.message
      end

    end

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