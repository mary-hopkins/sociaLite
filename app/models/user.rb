class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_one :profile
  accepts_nested_attributes_for :profile
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :posts
  
  
  
  def sort_posts
    if posts
      sorted_posts = posts.order('posts.created_at DESC')
      return sorted_posts
    end
  end


end



 