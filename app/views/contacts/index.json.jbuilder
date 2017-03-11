json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :client, :phone, :mail, :other, :company_id
  json.url contact_url(contact, format: :json)
end
