class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_name, :department

  def department
    {
      name: object.department.name
    }
  end
end
