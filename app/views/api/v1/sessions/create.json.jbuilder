json.status do
  json.type "success"
  json.message "Success"
  json.code 201
  json.error false
end
json.data do
  json.user do
    json.(@user, :id, :email, :authentication_token)
  end
  json.status "Authenticated"
end
