json.array!(@gclife_registrations) do |gclife_registration|
  json.extract! gclife_registration, :id, :user_id, :mobileno, :fullname, :gender, :dob, :emergencycontact, :occupation, :address1, :address2, :locationcode, :statecode, :countrycode, :pincode, :activeflag
  json.url gclife_registration_url(gclife_registration, format: :json)
end
