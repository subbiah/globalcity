json.array!(@building_masters) do |building_master|
  json.extract! building_master, :id, :buildinname, :society_id, :flatno, :flattype, :activeflag
  json.url building_master_url(building_master, format: :json)
end
