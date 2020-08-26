class Post < ApplicationRecord
    belongs_to :user
    validates :body, presence: true,
                     length: { minimum: 5 }
    has_many :comments, dependent: :destroy
    accepts_nested_attributes_for :comments
    # has_one_attached :photo
    has_many :likes, dependent: :destroy


    def getpostauthor
        author = User.find(user_id)
        authorName = author.profile.name
        return authorName
    end

    def getposttime
        dateTime = created_at.strftime("%B %d, %Y")
        return dateTime
    end
    
    def author
        User.find(user_id)
    end
    
end
