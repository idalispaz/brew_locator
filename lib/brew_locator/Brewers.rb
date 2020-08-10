class Brewers
    attr_reader :name, :street, :brewery_type, :city, :website_url
    @@all = []

    def initialize(brewery_info)
        @name = brewery_info["name"] 
        @street = brewery_info ["street"]
        @city = brewery_info ["city"]
        @brewery_type = brewery_info["brewery_type"]
        @website_url = brewery_info ["website_url"]
        @@all << self 
    end 

    def self.all 
        @@all
    end 

    def print_pretty
        puts @name.colorize(:yellow)
        puts "\n"
        puts @street
        puts "\n"
        puts @city 
        puts "\n"
        puts @brewery_type
        puts "\n"
        puts @website_url.colorize(:blue)
        puts "\n"
    end 
end 
