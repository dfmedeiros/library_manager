FactoryGirl.define do
  factory :employee do
    full_name { FactoryGirl.generate(:full_name) }
    registration { FactoryGirl.generate(:registration)}
    email { FactoryGirl.generate(:email) }
    password 'password'
    password_confirmation 'password'
  end
end
