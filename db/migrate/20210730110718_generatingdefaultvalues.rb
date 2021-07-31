class Generatingdefaultvalues < ActiveRecord::Migration[6.1]
  def change
    change_column :availibilities, :active, :boolean, default: true
    change_column :availibilities, :not_active, :boolean, default: false
  end
end
