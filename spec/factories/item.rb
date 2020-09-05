FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "NAME#{n}" }
    sequence(:caption) { |n| "#{n}" }
    sequence(:image_id) { |n| "#{n}" }
    sequence(:price) { |n| n }
  end
end
