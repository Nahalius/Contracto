json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :number, :date, :agreemnt_id, :amount, :manager, :text
  json.url invoice_url(invoice, format: :json)
end
