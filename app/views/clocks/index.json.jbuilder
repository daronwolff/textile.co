json.array!(@clocks) do |clock|
  json.extract! clock, :id, :date, :employee_id, :evaluation, :moment_id, :diference
  json.url clock_url(clock, format: :json)
end
