class AddColumnsToSolicitud < ActiveRecord::Migration[5.0]
  def change
  	add_column :solicituds, :nombre_responsable, :string
  	add_column :solicituds, :correo_responsable, :string
  end
end
