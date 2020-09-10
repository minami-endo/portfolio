

namespace :gift_status do
  desc '掲載予定日時を過ぎた景品を掲載状態にする'
  task published: :environment do
    Gift.period.find_each do |period|
      if period[:end_month] < Time.current
        gift&.published!
      end
    end
  end
end