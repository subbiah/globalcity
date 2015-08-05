json.array!(@association_masters) do |association_master|
  json.extract! association_master, :id, :associationname, :township_id, :address1, :address2, :locationcode, :citycode, :districcode, :statecode, :countrycode, :pincode, :activeflag
  json.url association_master_url(association_master, format: :json)
end
