class AddChanges < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :nombre, :string
  	add_column :users, :apellido, :string
  	add_column :users, :telefono, :string
  	add_column :users, :dependencia, :string
  	add_column :users, :cargo, :string
  	add_column :users, :rol, :integer
  end
end
