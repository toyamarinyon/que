class JobsController < ApplicationController

  include Garage::RestfulActions

  # def create
  #   @user = User.new user_params
  #   if @user.save
  #     render json: @user
  #   else
  #     render json: { :errors => @user.errors }, :status => 422
  #   end
  # end
  #
  private

    def job_params
      params.require(:job).permit(:query)
    end

end

