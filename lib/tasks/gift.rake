

namespace :gift do
  desc '掲載予定日を過ぎた景品を掲載状態にする'
  task published: :environment do
	  if period[:end_month] < Time.current
	    Gift.next_season_gift&.published!
	  end
  end
end