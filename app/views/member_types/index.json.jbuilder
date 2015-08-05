json.array!(@member_types) do |member_type|
  json.extract! member_type, :id, :membertype, :activeflag
  json.url member_type_url(member_type, format: :json)
end
