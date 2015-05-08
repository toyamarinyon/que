module AuthenticationHelper

  def authentication
    @user.generate_authentication_token
  end

  def authenticated?
    !current_user.nil?
  end

  def current_user
    return @current_user if @current_user
    if email = params[:email]
      user = User.find_by email: email
      if user.authenticated?(params[:token])
        @current_user = user
      end
    end
  end

end

