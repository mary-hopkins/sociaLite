class FeedsController < ApplicationController
    before_action :require_login
    def show
        @user = current_user
        @likes = @user.likes
        friend_posts = []
        friends = @user.friends
        friends.each do |friend|
            if friend.posts
                friend.posts.order('post.created_at DESC')
                friend.posts.each do |post|
                    friend_posts << post
                end
            end
        end
        friend_posts.sort_by{ |post| post.created_at}
        friend_posts = friend_posts.reverse()
        if friend_posts.length > 0
            @friends_post = friend_posts[0...30]
        end

    end

    def require_login
        unless user_signed_in?
            redirect_to welcome_index_url
        end
    end
end
