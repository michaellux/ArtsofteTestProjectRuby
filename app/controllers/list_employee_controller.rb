require "active_support/core_ext/digest/uuid"
require "securerandom"
class ListEmployeeController < ApplicationController
  def index
    @employee_places = EmployeePlace.joins(:employee, :department, :programming_language)
  end

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

  def update
    @employee = Employee.find_by(uuid: params[:employee][:id])
    @employee.update(employee_params);
    @employee_place = EmployeePlace.find_by_uuid(params[:employee_place][:id])
    @employee_place.update(
      department_id: params[:department][:id],
      programming_language_id: params[:programming_language][:id]
    );


    if @employee.save && @employee_place.save
      redirect_to root_path
    end
  end

  def employee_params
    params.require(:employee).permit(
      :name, :surname, :age, :gender, :department
    )
  end

  def employee_places_params
    params.require(:employee).permit(
      :department, :programming_language
    )
  end

  def edit
    @employee_place = index.find_by_uuid(params[:id])
    @employee_place_employee = index.find_by_uuid(params[:id]).employee
    @employee_place_department = index.find_by_uuid(params[:id]).department
    @employee_place_programming_language = index.find_by_uuid(params[:id]).programming_language
    puts @employee_place.inspect
  end

  def EmployeePlace
    def to_param
      uuid
    end
  end

end