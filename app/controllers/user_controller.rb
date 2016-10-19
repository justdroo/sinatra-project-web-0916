class UserController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'/users/index.html'
  end

  get '/users/new' do
    erb :'/users/new.html'
  end

  post '/users' do
    @user = User.create(params[:user])
    redirect "/users/#{@user.id}"
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    @restaurants = @user.restaurants
    erb :'/users/show.html'
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :"/users/edit.html"
  end

  patch "/users/:id/edit" do
    @user = User.find(params[:id])
    @user.update(params[:user])
    redirect "/users/#{@user.id}"
  end

  delete '/users/:id' do
    @user = User.find(params[:id])
    @user.destroy

    erb :'/users/deleted.html'
  end

end
