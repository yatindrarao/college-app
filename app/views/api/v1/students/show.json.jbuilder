json.status do
  json.type "success"
  json.message "Success"
  json.code 200
  json.error false
end

json.data do
  json.student do
    json.(@student, :id, :name, :age, :dob, :description, :semester_id)
  end
end
