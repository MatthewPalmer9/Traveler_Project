class RegistrationController < ApplicationController

  get '/registrations/failure' do
    erb :'/registrations/failure'
  end

  get '/signup' do
    erb :'/registrations/signup'
  end

  post '/signup' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect '/registrations/failure'
    end

    @this_user = User.find_by(username: params[:username], email: params[:email])
    if @this_user
      redirect '/registrations/failure'
    end
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user.save
    session[:user_id] = @user.id
    redirect '/users/home'
  end

end
