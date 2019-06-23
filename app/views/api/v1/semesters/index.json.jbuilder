json.status do
  json.type "success"
  json.message "Success"
  json.code 200
  json.error false
end
json.data do
  json.semesters @semesters, :id, :name, :credits, :start_date, :end_date
end
