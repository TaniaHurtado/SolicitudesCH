class AddMoreColumnsToSolicitud < ActiveRecord::Migration[5.0]
  def change
  	add_column :solicituds, :nombre_responsable2, :string
  	add_column :solicituds, :correo_responsable2, :string
  end
end
