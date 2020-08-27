class ProfilesController < ApplicationController
    def create
        @user = current_user
        @profile = @user.build_profile(profile_params)
        if @profile.save
            flash[:notice] = "You created a Profile"
            redirect_to users_path(@user)
        else 
            flash[:notice] = "Profile did NOT save"
            redirect_to root_path
        end
    end

    def show
        @user = current_user
        @profile = @user.profile
    end

    def edit
        @user = current_user
        @profile = @user.profile
    end

    def update
        @user = current_user
        @profile = @user.profile
        if @profile.photo && params[:photo]
            @profile.photo.purge
        end
        if @profile.update(profile_params)
            redirect_to @user
        else
            render 'edit'
        end
    end

    def delete
    end

private
    def profile_params
        params.require(:profile).permit(:birthday, :name, :location, 
                                        :work, :education, :relationship, 
                                        :interests, :user_id, :photo)
    end
end
