FactoryBot.define do
  factory :admin do
    sequence(:email) { |n| "ADMIN#{n}@example.com" }
    sequence(:password) { |n| "#{n}" * 6 }
  end
end
