class AddDatesToSolicitud < ActiveRecord::Migration[5.0]
  def change
  	remove_column :solicituds, :fecha
  	remove_column :solicituds, :nombre_responsable
  	remove_column :solicituds, :correo_responsable
  	remove_column :solicituds, :nombre_responsable2
  	remove_column :solicituds, :correo_responsable2

  	add_column :solicituds, :fecha_creada,  :datetime
  	add_column :solicituds, :fecha_notificada,  :datetime
  	add_column :solicituds, :fecha_aceptada,  :datetime
  	add_column :solicituds, :fecha_realizada,  :datetime

  end
end
