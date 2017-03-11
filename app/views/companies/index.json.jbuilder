json.array!(@companies) do |company|
  json.extract! company, :id, :name, :eik, :address, :manager
  json.url company_url(company, format: :json)
end
