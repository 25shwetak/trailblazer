class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]

  def new
    render cell(Session::Cell::New, nil, result: result)
    @error = params[:id]
  end

  def create
    if Session::Operation::Validate.(email: params[:email], password: params[:password])
      @user = User::Operation::Show.(email: params[:email])[:user]
      if @user && @user.authenticate(params[:password])
        token = JsonWebToken.encode(user_id: @user.id)
        session[:token] = token  
        redirect_to welcome_path
      else   
        error = "Invalid Credentials"   
        redirect_to login_path(id:error)
      end
    else   
      error = "One or more fields blank" 
      redirect_to login_path(id:error)
    end
  end

  def login
    
  end

  def welcome

  end

  def destroy      
    
    if session[:token] == nil
      redirect_to logout_path 
    else
      session[:token] = nil
      redirect_to users_path
    end

  end
end
