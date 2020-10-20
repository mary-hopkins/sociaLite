class SentRequestsController < ApplicationController
    def create
        @user = current_user
        @sent_request = @user.sent_requests.build(sent_request_params)
        if @sent_request.save
            requestee_id = @sent_request.requestee_id
            @requestee = User.find(requestee_id)
            @received_request = @requestee.received_requests.build(
                                user_id: requestee_id,
                                requestor_id: current_user.id)
            if @received_request.save
                redirect_to root_path
            else
            end
        else
        end
    end




private

def sent_request_params
    params.require(:sent_request).permit(:requestee_id)
end

end
