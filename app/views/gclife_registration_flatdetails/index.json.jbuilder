json.array!(@gclife_registration_flatdetails) do |gclife_registration_flatdetail|
  json.extract! gclife_registration_flatdetail, :id, :gclifeid, :societyid, :buildingid, :ownertypeid, :membertypeid, :relationshipid, :tenurestart, :tenureend
  json.url gclife_registration_flatdetail_url(gclife_registration_flatdetail, format: :json)
end
