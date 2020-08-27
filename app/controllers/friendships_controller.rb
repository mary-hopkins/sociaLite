class FriendshipsController < ApplicationController
    def create
        @friend = User.find(params[:friendship][:friend_id])
        @user = User.find(params[:friendship][:user_id])
        user_friendship = @user.friendships.build(user_id: params[:friendship][:user_id],
                                                 friend_id: params[:friendship][:friend_id])
        friend_friendship = @friend.friendships.build(friend_id: params[:friendship][:user_id],
                                                     user_id: params[:friendship][:friend_id])
        if user_friendship.save
            puts "saved user friendship"
            if friend_friendship.save
                puts "saved friend friendship"
                sent_received_cleanup(@friend, @user)
                redirect_back fallback_location: @friend
            else
                redirect_back fallback_location: @friend
            end
        else
            puts "didnt save user friendship"
            redirect_back fallback_location: @friend
        end
    end

    def destroy
        @user = User.find(params[:user_id])
        @friend = User.find(current_user.id)
        unfriend(@user, @friend)
        redirect_back fallback_location: @user
    end

private

    def unfriend(user, friend)
        user_id = user.id
        friend_friendships = friend.friendships
        friend_friendships.each do |friendship|
            if friendship.friend_id == user_id
                Friendship.destroy(friendship.id)
                puts "they destroyed it"
            end
        end
        user_friendships = user.friendships
        user_friendships.each do |friendship|
            puts "friend_id, current_id: #{friendship.friend_id}, #{current_user.id}"
            if friendship.friend_id == current_user.id
                Friendship.destroy(friendship.id)
                puts "we destroyed it"
            end
        end
    end

    def sent_received_cleanup(sender, receiver)
        puts "arrived at cleanup"
        puts "whould be red: #{sender.profile.name}"
        invites = sender.sent_requests
        invites.each do |invite|
            if invite.requestee_id == receiver.id
                puts 'will destroy 1'
                invite.destroy
            end
        end
        invites = receiver.received_requests
        invites.each do |invite|
            if invite.requestor_id == sender.id
                puts 'will destroy 2'
                invite.destroy
            end
        end
    end

    def friendship_params
        params.require(:friendship).permit(:friend_id, :user_id)
    end
end
