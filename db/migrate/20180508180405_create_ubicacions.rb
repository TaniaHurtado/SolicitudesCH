class CreateUbicacions < ActiveRecord::Migration[5.0]
  def change
    create_table :ubicacions do |t|
      t.string :lugar
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
