FactoryGirl.define do
  factory :job do
    query "SELECT * FROM UserData"
    query_status :planning
  end

end
