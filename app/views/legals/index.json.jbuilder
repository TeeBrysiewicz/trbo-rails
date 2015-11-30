json.array!(@legals) do |legal|
  json.extract! legal, :id, :name, :project_id
  json.url legal_url(legal, format: :json)
end
