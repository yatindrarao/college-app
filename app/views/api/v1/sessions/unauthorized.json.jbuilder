json.status do
  json.type "Unauthorized"
  json.message "Invalid email or password"
  json.code 401
  json.error true
end
