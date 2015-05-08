require 'active_support/concern'

module RequestHelper
  extend ActiveSupport::Concern

  included do

    let(:params) { {} }

    let(:env) do
      {
        accept: 'application/json',
      }
    end

    def log_in_as(user)
      params[:email] = user.email
      params[:password] = user.password
      post login_path, params
      authentication_token = JSON.parse(response.body)["user"]["authentication_token"]
      params.delete(:password)
      params[:token] = authentication_token
    end

    def log_out_as(user)
      post logout_path, params
    end

  end
end
