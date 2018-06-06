class Solicitud < ApplicationRecord
  belongs_to :user
  belongs_to :ubicacion
  has_one :evaluacion
  #has_many :user

  def self.solicitudes_filtro(
    estado = nil, 
    importancia = nil, 
    solicitante = nil,
    responsable = nil,   
    lugar = nil
    )
    solicitud = all
    solicitud = solicitud.where(estado: estado) if estado && estado != ""
    solicitud = solicitud.where(importancia: importancia) if importancia && importancia != ""
    solicitud = solicitud.where("nombre_responsable LIKE '%" + responsable + "%' OR nombre_responsable2 LIKE '%" + responsable + "%'") if responsable && responsable != ""
    solicitud = solicitud.where(user: solicitante) if solicitante && solicitante != ""
    solicitud = solicitud.where(lugar: lugar) if lugar && lugar != ""
    return solicitud
  end
end