class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to root_path
        else
            flash[:notice] = "Comment cannot be blank"
            redirect_to root_path
        end
    end

    def edit
        @user = current_user
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    end

    def update
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id]);
        if @comment.update(comment_params)
            redirect_to user_path(current_user)
        else
            flash[:notice] = "Something went wrong"
            redirect_to root_path
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to user_path(current_user)
    end

private
    def comment_params
        params.require(:comment).permit(:body)
    end

end
