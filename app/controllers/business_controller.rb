class BusinessController < ApplicationController

  get '/businesses' do
    if params[:search]
      @businesses = YelpApi.search(params) #building the array of business objects which you can find in the adapter folder.

    else
      @businesses = Business.all
    end
    erb :'/businesses/index.html'
  end


  # get '/businesses/search' do
  #   @client = Yelp.client
  #   erb :'/businesses/results.html'
  # end


  get '/businesses/:id' do
    @business = Business.find(params[:id])
    @users = @business.users
    @users_all = User.all
    erb :'/businesses/show.html'
  end

  patch '/businesses/:id' do
    @add = UserBusiness.create(user_id: params[:business][:user_id], business_id: params[:id])
    redirect "/businesses/#{params[:id]}"
  end

  # get '/businesses/:id/edit' do
  #   @business = business.find(params[:id])
  #   erb :"/businesses/edit.html"
  # end
  #
  # patch '/businesses/:id/edit' do
  #   @business = business.find(params[:id])
  #
  #   @business.update(params[:business])
  #   redirect "/businesses/#{@business.id}"
  # end
  #
  # delete '/businesses/:id' do
  #   @business = business.find(params[:id])
  #   @business.destroy
  #
  #   erb :'/businesses/deleted.html'
  # end



end
