class CLI 
    def call
        system("clear")
        welcome
        start
        @api = APIService.new
        Brewers
    end 

    def welcome
        puts "Hi there! Welcome to Brew! Where you can find breweries in your area! Down below you will type in your zip code or type in 'exit' to end program.".colorize(:yellow)
    end 
    
    def start 
        puts "\n"
        puts "Please type in your 5 digit zip code:".colorize(:yellow)
            @api = APIService.new
            @user_input = gets.chomp.downcase
            if @user_input != "exit"
                brewery = @api.get_breweries_by_zip_code(@user_input)
                brewery_info
                zip_code
            else
                goodbye 
            end 
    end

    def brewery_info 
        print "Which brewery would you like more information on?"
            @user_input = gets.chomp.downcase
            foundbrewery = Brewers.find_by_name(@user_input)
            puts foundbrewery.street
            puts foundbrewery.name
    end 

    def zip_code
        puts "Would You like to search again?".colorize(:green)
        puts "Yes"
        puts "No"
        puts "\n"
        @user_input = gets.chomp
        puts "\n"
        case @user_input 
        when "yes"
            start
        when "no"
            goodbye 
        else 
            puts "\n"
            puts "Didn't quite understand, Please try again: Yes or No?"
            puts "\n"
            zip_code
        end 
    end 
    
    def goodbye 
        puts "Thank you for using Brew! Until next time!".colorize(:yellow)
        puts "\n"
        exit 
    end 
end 