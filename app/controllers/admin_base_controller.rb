class AdminBaseController < ApplicationController
    before_action :authenticate
    before_action :authorize

  private

  def authenticate
    if current_user.nil?
      redirect_to(login_path, alert: "You must log in first")
    end
  end

  def authorize
    if current_user && current_user.standard?
        render(plain: "You must be admin", status: 403)
    end
  end
end