FactoryGirl.define do
  factory :user do
    name  { Forgery(:name).full_name }
    email { Forgery(:internet).email_address }
    password "foobar"
    password_confirmation "foobar"
  end

end
