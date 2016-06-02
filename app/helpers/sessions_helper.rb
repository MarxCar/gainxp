module SessionsHelper
    def current_user
        Admin.find_by(id: session[:user_id]) 
    end
    def logged_in?
        !current_user.nil?
    end
    def log_in user
       session[:user_id] = user.id
    end
    def logout
       session.delete(:user_id) 
    end
end
