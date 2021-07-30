class CreateAvailibilities < ActiveRecord::Migration[6.1]
  def change
    create_table :availibilities do |t|
      t.references :employee
      t.string :day
      t.boolean :active
      t.boolean :not_active
      t.timestamps
    end
  end
end
