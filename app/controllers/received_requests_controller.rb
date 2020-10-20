class ReceivedRequestsController < ApplicationController

    def create
        @user = User.find(params[:user_id])
        @received_request = @user.received_requests.build(received_request_params)
        if @received_request.save
            sender_id = @received_request.requestor_id
            @requestor = User.find(sender_id)
            @sent_request = @requestor.sent_requests.build(
                            user_id: sender_id,
                            requestee_id: @user.id)
            if @sent_request.save
                redirect_to root_path
            else
            end
        else
        end
    end

private

    def received_request_params
        params.require(:received_request).permit(:requestor_id, :user_id)
    end
end
