class CLI 
    def call
        system("clear")
        welcome
        menu
        @api = APIService.new
    end 

    def welcome
        puts "Hi there! Welcome to Brew! Where you can find breweries in your area! In the menu you will type in your zip code or type in 'exit' to end program.".colorize(:yellow)
    end 
    
    def menu 
        puts "\n"
        puts "Please type in your 5 digit zip code:".colorize(:yellow)
            @api = APIService.new
            @user_input = gets.chomp 
            if @user_input != "exit"
                brewery = @api.get_breweries_by_zip_code(@user_input)
                zip_code
            else
                goodbye 
            end 
    end

    def zip_code
        puts "Would You like to search again?".colorize(:green)
        puts "Yes"
        puts "No"
        puts "\n"
        @user_input = gets.chomp
        case @user_input 
        when "yes"
            menu
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
        puts "Thank you for using Brew! Until next time!"
        exit 
    end 
end 