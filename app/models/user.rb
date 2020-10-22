class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile
  accepts_nested_attributes_for :profile
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :posts
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments
  has_many :likes, dependent: :destroy
  has_many :sent_requests, dependent: :destroy
  has_many :received_requests, dependent: :destroy
  has_many :friendships, dependent: :destroy

  def userLikesThis(post)
    like = likes.where(post_id: post.id)
    return like.exists?
  end

  def get_sent_requests
    requests_array = []
    sent_requests.each do |request| 
      user = User.find(request.requestee_id)
      requests_array << user
    end
    return requests_array
  end

  def get_received_requests
    requests_array = []
    received_requests.each do |request| 
      user = User.find(request.requestor_id)
      requests_array << user
    end
    return requests_array
  end

  def friends
    friends_array = []
    friendships.each do |friend| 
      user = User.find(friend.friend_id)
      friends_array << user
    end
    return friends_array
  end

  def friends?(user)
    friendships = friends
    friendships.include?(user)
  end

  def friends_of_friends
    friends_array = []
    friends.each do |friend|
      friend.friends.each do |f|
        if !friends?(f) && f.id != id
          if !sent_request?(f) && !pending_request?(f)
            friends_array << f
          end
        end
      end
    end
    
    return friends_array
  end

  def sent_request?(user)
    requests = get_sent_requests
    requests.include?(user)
  end

  def pending_request?(user)
    requests = get_received_requests
    requests.include?(user)
  end

  def sort_posts
    if posts
      sorted_posts = posts.order('posts.created_at DESC')
      return sorted_posts
    end
  end

  def self.search(searck)
    if searck != "" && searck != nil
    search = searck.downcase
    user_ids = []
        Profile.all.each do |profile|
          if profile.name.downcase == search
            user_ids << profile.user_id
          end
        end
        users = User.find(user_ids)
        return users
    else
      User.all
    end
  end


end
