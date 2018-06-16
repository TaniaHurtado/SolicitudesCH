json.extract! observation, :id, :motivo, :descripcion, :Solicitud_id, :created_at, :updated_at
json.url observation_url(observation, format: :json)
