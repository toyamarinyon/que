class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token
  include AuthenticationHelper

  respond_to :json

  rescue_from StandardError, :with => :error_500
  def error_500(error = nil)
    render json: { error: { message: error.message} }, status: 500
  end
end
