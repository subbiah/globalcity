json.array!(@society_masters) do |society_master|
  json.extract! society_master, :id, :societyname, :association_id, :address1, :address2, :locationcode, :citycode, :districcode, :statecode, :countrycode, :pincode, :activeflag
  json.url society_master_url(society_master, format: :json)
end
