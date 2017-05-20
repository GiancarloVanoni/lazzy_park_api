class UserApi

  def initialize(user_id, user_token)
    @user_id = user_id
    @user_token = user_token
  end

  def call
    @user_id = 14
    uri = "http://192.168.1.52:8000/api/users/#{@user_id}/confirm"
    token = "Token #{@user_token}"
    headers = { "Authorization" => token }

    response = HTTParty.patch(uri, headers: headers)

    response.ok?
  end

end
