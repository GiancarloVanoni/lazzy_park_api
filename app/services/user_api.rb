class UserApi

  def initialize(user_id, user_token)
    @user_id = user_id
    @user_token = user_token
  end

  def call
    uri = "https://lazzy-park-users.herokuapp.com/api/users/#{@user_id}/confirm/"
    token = "Token #{@user_token}"
    headers = { "Authorization" => token }

    response = HTTParty.patch(uri, headers: headers)

    response.ok?
  end

end
