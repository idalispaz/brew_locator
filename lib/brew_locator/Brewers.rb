class Brewers
    attr_reader  :name, :street, :website_url
    @@all = []

    def initialize(brewery_info)
        @name = brewery_info["name"] 
        @street = brewery_info ["street"]
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
        # puts "\n"
        # puts @street
        # puts "\n"
        # puts @city 
        # puts "\n"
        # puts @brewery_type
        # puts "\n"
        # puts @website_url.colorize(:blue)
        # puts "\n"
    end 
end 