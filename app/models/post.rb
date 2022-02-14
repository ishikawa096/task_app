class Post < ApplicationRecord
    validates :title, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validate :end_date_is_after_today
    validate :end_date_is_after_start_date
    validates :allday, inclusion: { in: [true, false] }

    def end_date_is_after_today
      if end_date == nil || end_date < Date.today 
        errors.add(:end_date, "は今日以降の日付を選択してください")
      end
    end
    
    def end_date_is_after_start_date
       if end_date != nil && start_date != nil
         errors.add(:end_date, "を開始日より前の日付にすることはできません") if end_date < start_date
       end
    end
end