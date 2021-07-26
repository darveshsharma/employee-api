class Api::V1::DepartmentsController < ApplicationController


  def index 
    departments = Department.all
    render json: {
        data: ActiveModelSerializers::SerializableResource.new(departments, each_serializer: DepartmentSerializer),
        message: ['Department list fetched successfully'],
        status: 200,
        type: 'Success'
      }
  end

  def show 
    departments = Department.find(params[:id])
    render json: {
        data: ActiveModelSerializers::SerializableResource.new(departments, each_serializer: DepartmentSerializer),
        message: ['Department fetched successfully'],
        status: 200,
        type: 'Success'
      }
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      render json: @department
    else
      render error: {error: 'Unable to create department.'}, status: 400
    end
  end
  
  def update 
    @department = Department.find(params[:id])
    if @department
      @department.update(department_params)
      render json: {message: 'Department updated succesfully'},status: 200
    else
      render error: {error: 'Unable to update.'}, status: 400
    end
  end

  def destroy 
    @department.find(params[:id])
    if @department
      @department.destroy
      render json: {message: 'Department is deleted succesfully'},status: 200
    else
      render error: {error: 'Unable to delete.'}, status: 400
    end
  end

  def department_params
    params.require(:department).permit(:name)
  end
end
