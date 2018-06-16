class CreateObservations < ActiveRecord::Migration[5.0]
  def change
    create_table :observations do |t|
      t.string :motivo
      t.string :descripcion
      t.references :solicitud, foreign_key: true

      t.timestamps
    end
  end
end
