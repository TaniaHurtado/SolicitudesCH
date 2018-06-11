class ChangeUbicacionsFk < ActiveRecord::Migration[5.0]
  def change
  	remove_foreign_key :ubicacions, :users
  	remove_reference :ubicacions, :user, index: true
  	
  end
end
