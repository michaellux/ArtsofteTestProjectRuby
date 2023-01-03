class DepartmentController < ApplicationController
  def add
    @department = Department.new
  end

  def create
    @department = Department.create(department_params)

    if @department.save
      redirect_to root_path
    end
  end

  def department_params
    params.require(:department).permit(
      :name, :floor
    )
  end
end