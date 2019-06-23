json.(user, :id, :email)
json.token user.generate_jwt_token