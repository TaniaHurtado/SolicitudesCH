json.extract! evaluacion, :id, :calificacion, :obervacion, :solicitud_id, :created_at, :updated_at
json.url evaluacion_url(evaluacion, format: :json)
