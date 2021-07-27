class CreateempSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_name, :salary, :dob, :department_id

end