FactoryGirl.define do
  factory :book do
    title { FactoryGirl.generate(:title) }
    author { FactoryGirl.generate(:author)}
  end
end
