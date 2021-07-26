class Api::V1::EmployeesController < ApplicationController

  def index 
    employees = Employee.all.includes(:department)
    render json: {
        data: ActiveModelSerializers::SerializableResource.new(employees, each_serializer: EmployeeSerializer),
        message: ['Employee list fetched successfully'],
        status: 200,
        type: 'Success'
      }
  end

  def show 
    employees = Employee.find(params[:id])
    render json:  {
      data: ActiveModelSerializers::SerializableResource.new(employees, each_serializer: EmployeeSerializer),
      message: ['Employee list fetched successfully'],
      status: 200,
      type: 'Success'
      }
  end

  def create
    # @employee = Employee.new(employee_params)
    employee = EmployeeCreator.new(employee_params[:name],employee_params[:last_name],employee_params[:salary],employee_params[:dob],employee_params[:department_id]).call
    if @employee.save
      render json: @employee
    else
      render error: {error: 'Unable to create employee.'}, status: 400
    end
  end
  
  def update 
    @employee = Employee.find(params[:id])
    if @employee
      @employee.update(employee_params)
      render json: {message: 'Employee updated succesfully'},status: 200
    else
      render error: {error: 'Unable to update.'}, status: 400
    end
  end

  def destroy 
    @employee.find(params[:id])
    if @employee
      @employee.destroy
      render json: {message: 'Employee is deleted succesfully'},status: 200
    else
      render error: {error: 'Unable to delete.'}, status: 400
    end
  end

  def employee_params
    params.require(:employee).permit(:name, :last_name, :salary, :dob, :department_id)
  end
end



