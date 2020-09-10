class Gift < ApplicationRecord
	attachment :image

    validates :name, presence: true, length: { minimum: 1, maximum: 30 }
    validates :comment, presence: true, length: { minimum: 1, maximum: 100 }
    validates :image, presence: true

    enum gift_status: { not_published: false, published: true }

    def self.next_season_gift
	  beginning_of_month = period[:start_month]
	  end_of_month = period[:end_month]
	  where(created_at: beginning_of_month..end_of_month).first
	end

    def self.period
	    year = Time.now.strftime('%Y').to_i
	    start_months = [1, 4, 7, 10]
	    end_months = [3, 6, 9, 12]
	    beginning_of_month_list = start_months.map { |m| Time.new(year, m).beginning_of_month }
	    end_of_month_list = end_months.map { |m| Time.new(year, m).end_of_month }
	    periods = beginning_of_month_list.zip(end_of_month_list)
	    start_month = 0
	    end_month = 0
	    periods.each do |period|
	      if period[0] < DateTime.now && DateTime.now < period[1]
	        start_month = period[0]
	        end_month = period[1]
	      end
	    end
	    { start_month: start_month, end_month: end_month }
	  end
end
