class AddResponsableToUbicacions < ActiveRecord::Migration[5.0]
  def change
  	add_column :ubicacions, :users, :string
  
  end
end
