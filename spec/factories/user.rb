FactoryBot.define do
  factory :user do
    name { "testuser1" }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    sequence(:password) { |n| "#{n}" * 6 }
    phone_number { '09012345678' }
    address { '東京' }
    postal_code { '0432111' }
  end
end
