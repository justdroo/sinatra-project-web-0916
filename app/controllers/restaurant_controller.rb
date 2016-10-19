class RestaurantController < ApplicationController

  get '/restaurants' do
    if params[:search]
      @restaurants = [Restaurant.find_by(params[:search])] #building the array of business objects which you can find in the adapter folder.

    else
      @restaurants = Restaurant.all
    end
    erb :'/restaurants/index.html'
  end

  get '/restaurants/new' do
    erb :'/restaurants/new.html'
  end

  post '/restaurants' do
    @restaurant = Restaurant.create(params[:restaurant])
    redirect "/restaurants/#{@restaurant.id}"
  end

  get '/restaurants/search' do
    @client = Yelp.client

    binding.pry
    erb :'/restaurants/results.html'
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

  get '/restaurants/:id/edit' do
    @restaurant = Restaurant.find(params[:id])
    erb :"/restaurants/edit.html"
  end

  patch '/restaurants/:id/edit' do
    @restaurant = Restaurant.find(params[:id])

    @restaurant.update(params[:restaurant])
    redirect "/restaurants/#{@restaurant.id}"
  end

  delete '/restaurants/:id' do
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    erb :'/restaurants/deleted.html'
  end



end
