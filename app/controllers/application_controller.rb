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

   get '/users/home' do
     erb :'/users/home'
   end

   get '/registrations/failure' do
     erb :'/registrations/failure'
   end

   post 'signup' do
     if params[:username].empty? || params[:email].empty? || params[:password].empty?
       redirect '/registrations/failure'
     elsif params[:username].exists? || params[:email].exists?
       redirect '/registrations/failure'
     end

     @user = User.new(username: params[:username], email: params[:email], password: params[password])
     @user.save
     session[:user_id] = @user.id

     redirect '/users/home'
   end
end
