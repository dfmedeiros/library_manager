FactoryGirl.define do
  factory :student do
    full_name { FactoryGirl.generate(:full_name) }
    registration { FactoryGirl.generate(:registration)}
  end
end
