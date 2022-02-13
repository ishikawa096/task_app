class Post < ApplicationRecord
    validates :title, presence: true
    validates :startdate, presence: true
    validates :enddate, presence: true
    validate :end_date_is_after_today?
    validates :allday, inclusion: { in: [true, false] }

    def end_date_is_after_today?
        if enddate == nil || enddate < Date.today 
          errors.add(:enddate, "は今日以降の日付を選択してください")
        end
      end
end
