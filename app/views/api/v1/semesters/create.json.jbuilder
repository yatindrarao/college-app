json.status do
  json.type "success"
  json.message "Success"
  json.code 201
  json.error false
end

json.data do
  json.semester do
    json.(@semester, :id, :name, :credits, :start_date, :end_date)
  end
end
