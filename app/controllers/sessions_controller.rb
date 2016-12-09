class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(session_params[:email], session_params[:password])

    if @user
      log_in_user(@user)
      redirect_to bands_url
    end
  end

  def destroy
    if current_user
      log_out
      redirect_to new_session_url
    end
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end
end
