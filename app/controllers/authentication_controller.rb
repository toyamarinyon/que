class AuthenticationController < ApplicationController

  def create
    @user ||= User.find_by email: params[:email]
    if @user && @user.authenticate(params[:password])
      authentication
      render json: @user
    else
      render json: { error: { message: 'wrong email or password' } }
    end
  end

end

