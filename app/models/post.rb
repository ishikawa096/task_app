class Post < ApplicationRecord
    validates :title, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validate :end_date_is_after_today
    validates :allday, inclusion: { in: [true, false] }

    def end_date_is_after_today
        if end_date == nil || end_date < Date.today 
          errors.add(:end_date, "は今日以降の日付を選択してください")
        end
      end
end
