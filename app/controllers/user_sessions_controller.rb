class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
     if @user = login(params[:email], params[:password], params[:remember_me])
      redirect_back_or_to(root_url, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end
  # def destroy
  #   user_session[:user_id] = nil
  #
  #   flash[:notice] = "You're logged out!"
  #   redirect_to root_url
  # end
  def destroy
    logout
    redirect_to root_url, notice: 'Logged out!'
  end
end
