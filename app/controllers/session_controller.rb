class SessionController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])
        
        if user && user.authenticate(params[:password]) session[:user_id] = user.id.to_s redirect_to(root_path, notice: "Logged in!")
        else
            render(:new) 
        end
    end 
end
