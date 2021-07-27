class EmployeeCreator
  attr_reader employee_params
  
  def initialize(employee_params)
    @name = employee_params[:name]
    @last_name = employee_params[:last_name]
    @salary = employee_params[:salary]
    @dob = employee_params[:dob]
    @department_id = employee_params[:department_id]
  end
  
  def call
    Employee.create(name: @name, last_name: @last_name, salary: @salary, dob: @dob, department_id: @department_id)
  end
end