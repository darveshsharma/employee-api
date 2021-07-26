class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :last_name
      t.bigint :salary
      t.date :dob
      t.references :department
      t.timestamps
    end
  end
end
