class APIService

    BASE_URI = "https://api.openbrewerydb.org/breweries?by_postal="

        #get breweries based on zip code 
    def get_breweries_by_zip_code(zip)
        @zipstring = zip
        uri = URI(BASE_URI + "#{@zipstring}")
        @breweries = make_request(uri)
             @breweries != nil 
                 brewery_name_list
     end 

    #make the request and get the response
    def make_request(uri)
        response = Net::HTTP.get_response(uri)
        JSON.parse(response.body)
    end 

    def brewery_name_list
        @breweries.each do | brew_array | 
             brewers = Brewers.new(brew_array) 
             brewers.print_pretty
        end 
    end 
end 