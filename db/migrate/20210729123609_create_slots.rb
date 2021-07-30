class CreateSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :slots do |t|
      t.references :availibility
      t.integer    :from  
      t.integer    :to
      t.timestamps
    end
  end
end
