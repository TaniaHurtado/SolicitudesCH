json.extract! solicitud, :id, :descripcion, :tipo, :importancia, :estado, :materiales, :fecha, :lugar, :user_id, :created_at, :updated_at
json.url solicitud_url(solicitud, format: :json)
