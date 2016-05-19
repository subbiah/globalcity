json.array!(@facilitator_society_masters) do |facilitator_society_master|
  json.extract! facilitator_society_master, :id, :society_id, :category, :facilitatorname, :mobilenumber, :mobilenumber2, :emailid, :location, :city, :state, :country, :pincode, :activeflag, :createdby
  json.url facilitator_society_master_url(facilitator_society_master, format: :json)
end
