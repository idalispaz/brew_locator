class Brewers
    attr_reader  :name, :street, :brewery_type, :city, :website_url
    @@all = []

    def initialize(brewery_info)
        @name = brewery_info["name"] 
        @street = brewery_info ["street"]
        @brewery_type = brewery_info ["brewery_type"]
        @city = brewery_info ["city"]
        @website_url = brewery_info ["website_url"]
        @@all << self 
    end 
   
    def self.all 
        @@all
    end 

     def self.find_by_name(name)
        self.all.detect { | brewery | brewery.name.downcase == name.downcase } 
     end 

    def print_pretty
        puts @name
    end 
end 