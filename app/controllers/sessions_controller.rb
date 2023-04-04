class SessionsController < ApplicationController
  skip_before_action :authorized

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
    else
      @user = User.new(email: params[:session][:email], password: params[:session][:password])
      if @user.save
        session[:user_id] = @user.id
      else
        flash[:alert] = "#{@user.errors.full_messages.sort.first}"
      end
    end

    redirect_to '/'
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
