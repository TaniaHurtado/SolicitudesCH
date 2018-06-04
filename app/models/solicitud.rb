class Solicitud < ApplicationRecord
  belongs_to :user
  belongs_to :ubicacion
  has_one :evaluacion
  #has_many :user

  def self.solicitudes_por_estado(estado)
    if estado == nil
      all
    else
      if estado == "Todas"
        where("") #Return all columns
      else
        where("estado = ?", estado) #Return an especified state
      end
    end
  end
end
