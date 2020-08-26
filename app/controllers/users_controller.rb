class UsersController < ApplicationController
    before_action :require_login
    def index
        @users = User.search(params[:search])
    end
    
    def show
        @user = User.find(params[:id])
    end


    def current_user_home
        redirect_to current_user
    end
private

    def require_login
        unless user_signed_in?
            redirect_to welcome_index_url
        end
    end

    def user_params
        params.require(:user).permit(:email, :password, :search)
    end
end
