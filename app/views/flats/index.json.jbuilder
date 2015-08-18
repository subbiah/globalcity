json.array!(@flats) do |flat|
  json.extract! flat, :id, :flat, :flat_types, :building_id, :active_flag
  json.url flat_url(flat, format: :json)
end
