json.array!(@agreemnts) do |agreemnt|
  json.extract! agreemnt, :id, :name, :date, :client_id, :amount, :budget_hours, :manager
  json.url agreemnt_url(agreemnt, format: :json)
end
