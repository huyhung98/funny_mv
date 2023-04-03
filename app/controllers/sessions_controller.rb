class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
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
end
