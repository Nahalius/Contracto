json.array!(@payments) do |payment|
  json.extract! payment, :id, :date, :agreemnt_id, :amount, :text
  json.url payment_url(payment, format: :json)
end
