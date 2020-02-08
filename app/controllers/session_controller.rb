class SessionController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])
        
        if user && user.authenticate(params[:password_digest]) 
            session[:user_id] = user.id.to_s 
            redirect_to(root_path, notice: "Logged in!")
        else
            render(:new) 
        end
    end 

    def destroy 
        session.clear
        cookies.clear
        redirect_to(root_path, notice: "Logged Out")
    end
end
