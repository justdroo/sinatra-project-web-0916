class User < ActiveRecord::Base
  has_many :user_restaurants
  has_many :restaurants, through: :user_restaurants
  has_many :user_businesses
  has_many :businesses , through: :user_businesses
end
