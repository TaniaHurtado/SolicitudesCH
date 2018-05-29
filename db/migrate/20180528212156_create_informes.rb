class CreateInformes < ActiveRecord::Migration[5.0]
  def change
    create_table :informes do |t|
      t.string :nombre
      t.string :archivo

      t.timestamps
    end
  end
end
