class RestaurantController < ApplicationController

  get '/restaurants' do
    erb :'/restaurants/index.html'
  end

  get '/restaurants/new' do
    erb :'/restaurants/new.html'
  end

  post '/restaurants' do
    @restaurant = Restaurant.create(params[:restaurant])
    redirect "/restaurants/#{@restaurant.id}"
  end


  get '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    @users = @restaurant.users
    @users_all = User.all
    erb :'/restaurants/show.html'
  end

  patch '/restaurants/:id' do
    @add = UserRestaurant.create(user_id: params[:restaurant][:user_id], restaurant_id: params[:id])
    redirect "/restaurants/#{params[:id]}"
  end



end
