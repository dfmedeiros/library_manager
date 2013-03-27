FactoryGirl.define do
  sequence(:email) { |n| "demo#{n}@example.com" }
  sequence(:title) { |n| "Book #{n}" }
  sequence(:author) { |n| "Author #{n}" }
  sequence(:full_name) { |n| "User #{n}" }
  sequence(:registration) { |n| "ABC00#{n}" }
end
