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

  end
end
