class AddDateToSolicitud < ActiveRecord::Migration[5.0]
  def change
    add_column :solicituds, :fecha_comentada,  :datetime
    add_column :solicituds, :fecha_no_realizada,  :datetime
  end
end
