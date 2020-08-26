class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user
    validates :body, presence: true,
                       length: { in: 1..200 }
  
    def getCommentAuthor
      author = User.find(user_id)
      authorName = author.profile.name
      return authorName
    end
    
end
  