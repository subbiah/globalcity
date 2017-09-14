json.array!(@important_contacts) do |important_contact|
  json.extract! important_contact, :id, :name, :phno, :email, :category
  json.url important_contact_url(important_contact, format: :json)
end
