class UsersController < ApplicationController

  respond_to :json

  def create
    @user = User.new user_params
    if @user.save
      render json: @user, status: 201
    else
      render json: @user.errors, status: 422
    end
  end

  def show
    @user = User.find params[:id]
    render json: @user
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
