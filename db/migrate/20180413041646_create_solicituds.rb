class CreateSolicituds < ActiveRecord::Migration[5.0]
  def change
    create_table :solicituds do |t|
      t.string :descripcion
      t.string :tipo
      t.string :importancia
      t.string :estado
      t.string :materiales
      t.datetime :fecha
      t.string :lugar
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
