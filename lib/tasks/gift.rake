

namespace :gift do
  desc '掲載予定日を過ぎた景品を掲載状態にする'
  task published: :environment do
    Gift.next_season_gift.find_each do |gift|
      if period[:end_month] < Time.current
        gift&.published!
      end
    end
  end
end