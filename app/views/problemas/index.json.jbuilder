json.array!(@problemas) do |problema|
  json.extract! problema, :proyect_id, :problema, :descripcion
  json.url problema_url(problema, format: :json)
end