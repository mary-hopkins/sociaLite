class LikesController < ApplicationController
    before_action :find_like, only: [:destroy]
    def create
        @post = Post.find(params[:post_id])
        @post.likes.create(user_id: current_user.id)
        redirect_back fallback_location: @post
    end

    def destroy
        @post = Post.find(params[:post_id])
        @like = Like.find(params[:id])
        @like.destroy

        redirect_back fallback_location: @post
    end

    private
    def already_liked?
        Like.where(user_id: current_user.id, post_id:
            params[:post_id]).exists?
    end

    def find_like
        @post = Post.find(params[:post_id])
        @like = @post.likes.find(params[:id])
    end

    def find_post
        @post = Post.find(params[:post_id])
    end
end
