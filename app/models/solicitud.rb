class Solicitud < ApplicationRecord
  belongs_to :user
  belongs_to :ubicacion
  has_one :evaluacion, dependent: :destroy
  has_one :observation, dependent: :destroy
  #has_many :user

  def self.solicitudes_filtro(
    estado = nil, 
    importancia = nil, 
    solicitante = nil,
    responsable = nil,   
    lugar = nil
    )
    solicitud = all
    solicitud = solicitud.joins("INNER JOIN ubicacions_users ON solicituds.ubicacion_id = ubicacions_users.ubicacion_id AND ubicacions_users.user_id = " + responsable).group("solicituds.id")  if responsable && responsable != ""
    solicitud = solicitud.where(estado: estado) if estado && estado != ""
    solicitud = solicitud.where(importancia: importancia) if importancia && importancia != ""
    solicitud = solicitud.where(user: solicitante) if solicitante && solicitante != ""
    solicitud = solicitud.joins(:ubicacion).where("ubicacions.lugar = ?", lugar) if lugar && lugar != ""  
    return solicitud
  end
end