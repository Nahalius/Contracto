json.array!(@surveys) do |survey|
  json.extract! survey, :id, :name, :company_id, :section, :text
  json.url survey_url(survey, format: :json)
end
