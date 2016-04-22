json.array!(@departments) do |department|
  json.extract! department, :id, :name, :description, :arrival_time, :departure_time, :tolerance
  json.url department_url(department, format: :json)
end
