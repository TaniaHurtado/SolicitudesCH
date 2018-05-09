class Solicitud < ApplicationRecord
  belongs_to :user
  belongs_to :ubicacion
end
