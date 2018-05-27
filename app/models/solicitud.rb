class Solicitud < ApplicationRecord
  belongs_to :user
  belongs_to :ubicacion
  has_one :evaluacion
end
