class SessionController < ApplicationController

  get '/sessions/failure' do
    erb :'/sessions/failure'
  end

  get '/sessions/logout' do
   session.clear
   erb :index
  end

  get'/login' do
    erb :'/sessions/login'
  end

  post '/login' do
   @user = User.find_by(email: params[:email])
   if @user && @user.authenticate(params[:password])
     session[:user_id] = @user.id
     redirect '/users/home'
   end
   redirect '/sessions/failure'
  end

end
