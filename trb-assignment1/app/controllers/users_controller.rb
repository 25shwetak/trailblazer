class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :index]

  def welcome
    result = User::Operation::Welcome.call(token: session[:token])
    render cell(User::Cell::Welcome, nil, result: result)
  end

  def index
    run User::Operation::Index do | result |
      return render cell(User::Cell::Index, nil, result: result)
    end
  end

  def new 
    run User::Operation::New do | result |
      return render cell(User::Cell::New, nil, form: @form)
    end
  end

  def create
    run User::Operation::Create do | result |
      token = JsonWebToken.encode(user_id: result[:model].id)
      session[:token] = token
      return redirect_to welcome_path
    end

    return render cell(User::Cell::New, nil, form: @form)
  end
end