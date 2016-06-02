class SessionsController < ApplicationController
    def new
        
    end
    
    def create
        user = Admin.find_by_username(params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            log_in user
            redirect_to root_path
        else
            flash.now[:danger] = "Incorrect password/username combination"
            render 'new'
        end
    end
    def destroy
       logout
       redirect_to root_path
    end
end
