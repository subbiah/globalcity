json.array!(@society_member_masters) do |society_member_master|
  json.extract! society_member_master, :id, :society_id, :gclife_id, :fullname, :building_id, :mobileno, :ownertype, :membertyper, :activeflag
  json.url society_member_master_url(society_member_master, format: :json)
end
