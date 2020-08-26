class PostsController < ApplicationController

    def create
        @user = User.find(params[:user_id])
        @post = @user.posts.build(post_params)
        if @post.save
            redirect_to user_path(@user)
        else
            render 'user/show'
        end
    end

    def edit
        @user = current_user
        @posts = @user.posts
        @post = @posts.find(params[:id]) 
    end

    def update
        @user = current_user
        @post = @user.posts.find(params[:id])
        # if @post.photo && params[:photo]
        #     puts "will delete photo"
        #     @post.photo.purge
        # end
        if @post.update(post_params)
            redirect_to @user
        else
            render 'edit'
        end
    end

    def destroy
        @user = current_user
        @post = @user.posts.find(params[:id])
        @post.destroy

        redirect_to user_path(current_user)
    end

private
    def post_params
        #params.require(:post).permit(:body, :photo)
        params.require(:post).permit(:body)
    end
end
