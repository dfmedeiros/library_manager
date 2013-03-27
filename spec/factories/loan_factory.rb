FactoryGirl.define do
  factory :loan do
    association(:book)
    association(:student)
    association(:employee)
    end_at Time.now + 3.days
  end
end
