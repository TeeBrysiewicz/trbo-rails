json.array!(@revisions) do |revision|
  json.extract! revision, :id, :name, :project_id
  json.url revision_url(revision, format: :json)
end
