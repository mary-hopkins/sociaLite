class Profile < ApplicationRecord
    belongs_to :user
    validates :name, presence: true,
                     length: { in: 2..200 }
    #has_one_attached :photo

    def getBirthday
        date = birthday.to_datetime
        date = date.strftime("%B %d, %Y")
    end
end
