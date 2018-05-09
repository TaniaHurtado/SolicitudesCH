class CreateEvaluacions < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluacions do |t|
      t.integer :calificacion
      t.string :obervacion
      t.references :solicitud, foreign_key: true

      t.timestamps
    end
  end
end
