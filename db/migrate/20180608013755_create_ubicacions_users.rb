class CreateUbicacionsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :ubicacions_users, :id => false do |t|
    	t.references :ubicacion, foreign_key: true
		t.references :user, foreign_key: true
    end
  end
end
