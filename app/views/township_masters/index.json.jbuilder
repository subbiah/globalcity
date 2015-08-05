json.array!(@township_masters) do |township_master|
  json.extract! township_master, :id, :townshipname, :activeflag, :address1, :address2, :locationcode, :citycode, :districtcode, :satecode, :countrycode, :pincode
  json.url township_master_url(township_master, format: :json)
end
