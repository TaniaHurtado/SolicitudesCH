class AddReferenceToSolicitud < ActiveRecord::Migration[5.0]
  def change
  	add_reference :solicituds, :ubicacion, foreign_key: true
  end
end
