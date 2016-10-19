class YelpApi


    def self.client

      @client = Yelp.client

    end

    def self.search(params)
       results = client.search(params[:search][:location],params[:search][:yelp_key] )

       results.businesses.map do |result|
         if Business.find_by(yelp_id: result.id)
           Business.find_by(yelp_id: result.id)
         else
           Business.create({
             name: result.name,
             address: result.location.address.join(", "),
             rating: result.rating,
             rating_img: result.rating_img_url,
             yelp_id: result.id})
         end #end if statement

       end #end do statement
   end #end self.search
end

#within map IF it exists, create object from DB(update later)
#ELSE create a new DB instance




#Dealing with APIs:

      # get the API /its entire data (normally an object, hash)
      # turn whatever data you're obtaining from yelp (API) into ActiveRecord objects/instances
      # map through it to make them instances

#Questions:
  #how to prevent duplicates and still update the rating and other things that may change over time.
