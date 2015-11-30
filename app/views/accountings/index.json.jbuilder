json.array!(@accountings) do |accounting|
  json.extract! accounting, :id, :name, :project_id
  json.url accounting_url(accounting, format: :json)
end
