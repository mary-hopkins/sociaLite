class NotificationsController < ApplicationController
    def show
        @user = current_user
        @received_requests = @user.get_received_requests
        @sent_requests = @user.get_sent_requests
        @friends_of_friends = @user.friends_of_friends
    end
end
