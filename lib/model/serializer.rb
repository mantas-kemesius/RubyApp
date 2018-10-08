require_relative 'User'
# Serializer
class Serializer
  def serializer(user)
    User.new(
        user['name'],
        user['lastName'],
        user['role_id'],
        user['email'],
        user['phone']
    )
  end
end