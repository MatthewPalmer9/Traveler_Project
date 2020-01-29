class UserController < ApplicationController

  get '/users/home' do
    @user = current_user
    @destination = @user.destinations
    erb :'/users/home'
  end

  get 'users/plan/:id' do
    @user = current_user
    @destination = @user.destinations

    erb :'/users/details.erb'
  end

  get '/users/plans' do
    @user = current_user
    @destination = @user.destinations
    erb :'/users/plans'
  end

  get '/users/plans/new' do
    @user = current_user
    erb :'/users/new'
  end

  post '/users/plans/new' do
    @user = current_user
    if params[:location].include?(" ")
      params[:location] = params[:location].split.join("%20")
    end
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

end
