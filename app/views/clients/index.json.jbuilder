json.array!(@clients) do |client|
  json.extract! client, :id, :name, :address, :manager, :id, :postcode, :company_id
  json.url client_url(client, format: :json)
end
