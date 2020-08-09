class Brewers
    attr_reader :name, :street
    @@all = []

    def initialize(brewery_info)
        @name = brewery_info["name"] 
        @street = brewery_info ["street"]
        @@all << self 
    end 

    def self.all 
        @@all
    end 

    def self.find_by_brewery_zip(name)
        self.all.find { |zip| zip.name.downcase == name.downcase}
    end 

    def print_pretty
        puts @name 
        puts @street
    end 
end 
