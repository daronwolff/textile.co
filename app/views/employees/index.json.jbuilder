json.array!(@employees) do |employee|
  json.extract! employee, :id, :first_name, :last_name, :mail, :birth, :department_id
  json.url employee_url(employee, format: :json)
end
