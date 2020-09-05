FactoryBot.define do
  factory :recipe do
    name { "test1" }
    ingredient { 'あああ' }
    time { '東京' }
    how_to_make { 'あああ' }
    item_id { '0432111' }
    user_id { '0432111' }
  end
end
