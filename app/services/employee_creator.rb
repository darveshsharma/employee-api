class EmployeeCreator
  attr_reader :name, :last_name, :salary, :dob, :department_id
  
  def initialize(name, last_name, salary, dob, department_id)
    @name = name
    @last_name = last_name
    @salary = salary
    @dob = dob
    @department_id = department_id
  end
  
  def call
    Employee.create(name: @name, last_name: @last_name, salary: @salary, dob: @dob, department_id: @department_id)
  end
end