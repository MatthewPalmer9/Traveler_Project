require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
   configure do
     set :views, "app/views"
     set :public_folder, "public/stylesheets"
     enable :sessions
     set :session_secret, "secret"
   end

   get '/' do
     erb :index
   end

   get '/signup' do
     erb :'/registrations/signup'
   end

   get'/login' do
     erb :'/registrations/login'
   end

   get '/sessions/failure' do
     erb :'/sessions/failure'
   end

   get '/sessions/logout' do
    session.clear
    erb :index
   end

   post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/users/home'
    end
    redirect '/sessions/failure'
   end

   get '/users/home' do
     @destination = Destination.all
     @user = current_user
     erb :'/users/home'
   end

   get '/users/plans' do
     @user = current_user
     erb :'/users/plans'
   end

   get '/users/plans/new' do
     @user = current_user
     erb :'/users/new'
   end

   post '/users/plans/new' do
     @user = current_user
     @destination = Destination.new(location: params[:location], schedule: params[:schedule])
     @destination.user_id = @user.id
     @destination.save
     redirect '/users/home'
   end

   get '/users/plans/:id/edit' do
     @user = current_user
     @destination = Destination.find(params[:id])
     erb :'/users/edit'
   end

   patch '/users/plans/:id' do
     @user = current_user
     @destination = Destination.find(params[:id])
     @destination.location = params[:location]
     @destination.schedule = params[:schedule]
     @destination.save
     redirect "/users/home"
   end

   delete '/users/plans/:id' do
     @user = current_user
     @destination = Destination.find(params[:id])
     @destination.delete
     redirect "users/home"
   end

   get '/registrations/failure' do
     erb :'/registrations/failure'
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

   #HELPERS
   helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end
end
