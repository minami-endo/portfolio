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

  def self.now_season_gift
    pre_beginning_of_month = previous_period[:previous_start_month]
    pre_end_of_month = previous_period[:previous_end_month]
    where(created_at: pre_beginning_of_month..pre_end_of_month).first
  end

  def self.previous_period
    year = Time.now.strftime('%Y').to_i
    previous_start_months = [1, 4, 7, 10]
    previous_end_months = [3, 6, 9, 12]
    pre_beginning_of_month_list = previous_start_months.map { |m| Time.new(year, m).beginning_of_month }
    pre_end_of_month_list = previous_end_months.map { |m| Time.new(year, m).end_of_month }
    previous_periods = pre_beginning_of_month_list.zip(pre_end_of_month_list)
    previous_start_month = 0
    previous_end_month = 0
    previous_periods.each do |period|
      if period[0] < DateTime.now.prev_month(3) && DateTime.now.prev_month(3) < period[1]
        previous_start_month = period[0]
        previous_end_month = period[1]
      end
    end
    { previous_start_month: previous_start_month, previous_end_month: previous_end_month }
  end
end
