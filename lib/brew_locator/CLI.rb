class CLI 
    def call
        system("clear")
        welcome

        until @user_input == "exit"
            start
        end 
            goodbye
    end 

    def welcome
        puts "Hi there! Welcome to Brew! Where you can find breweries in your area! Down below you will type in your zip code or type in 'exit' to end program.".colorize(:green)
    end 
    
    def start 
        puts "\n"
        puts "Please type in your 5 digit zip code:".colorize(:yellow)
            @api = APIService.new
            @user_input = gets.chomp.downcase
            case @user_input 
            when "exit"
             goodbye
            else  
                brewery = @api.get_breweries_by_zip_code(@user_input)
                if brewery != []
                    brewery_info
                    zip_code
                else   
                    puts "No breweries found or not recognized zip code."
                end 
            end 
        end 
    end

    def zip_code
        puts "\n"
        puts "Would You like to search again?".colorize(:green)
        puts "Yes"
        puts "No"
        puts "\n"
        @user_input = gets.chomp
        puts "\n"
        case @user_input.downcase
        when "yes"
            start
        when "no"
            goodbye 
        else 
            puts "\n"
            puts "Didn't quite understand, Please try again."
        end 
    end 

     
    def goodbye 
        puts "Thank you for using Brew! Until next time!".colorize(:yellow)
        puts "\n"
        exit 
    end 
    
    def brewery_info 
        print "Which brewery would you like more information on? Or you can type in Start Over to return to the beginning:"
            input = gets.chomp.downcase
            foundbrewery = Brewers.find_by_name(input)
            case input 
            when "start over"
                start 
            else  
                foundbrewery = Brewers.find_by_name(input)
                if foundbrewery != nil
                    puts "\n"
                    puts foundbrewery.name 
                    puts "Street Address:".colorize(:yellow)
                    puts foundbrewery.street
                    puts "Brewery Type:".colorize(:yellow)
                    puts foundbrewery.brewery_type
                    puts "City:".colorize(:yellow)
                    puts foundbrewery.city 
                    puts "Website:".colorize(:yellow)
                    puts foundbrewery.website_url
                else  
                    puts "I didn't quite understand that.".colorize(:red)
                    brewery_info
                end 
            end 
end 