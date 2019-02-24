class SessionsController < ApplicationController
  def new
  end

  def create
    user =  User.find_by(email:email_params[:email])
    if user && user.authenticate(password_params[:password])
      log_in user
      redirect_to new_topic_path
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end
end

private
def email_params
  params.require(:session).permit(:email)
end

def password_params
  params.require(:session).permit(:password)
end

def log_in(user)
  session[:user_id] = user.id
end
