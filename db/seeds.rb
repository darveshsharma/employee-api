# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

employee = (1..50).map do
  Employee.create!(
    name: "employee",
    last_name: "user",
    salary: 35_000,
    dob: Date.parse("7/09/1998"),
    department_id: rand(1..20)
  )
end