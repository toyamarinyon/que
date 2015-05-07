class Job < ActiveRecord::Base

  belongs_to :user

  enum query_status: %i(planning running finished canceled failed)

  validates :user_id, presence: true
  validates :query, presence: true

end
