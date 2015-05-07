module AuthenticationHelper

  def authentication
    @user.generate_authentication_token
  end

end

