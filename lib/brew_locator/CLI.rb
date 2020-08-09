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
        puts "Please type in your 5 digit zip code:".colorize(:yellow)
            @api_1 = APIService.new
            @user_input = gets.chomp 
            if @user_input != "exit"
                brewery = @api_1.get_breweries_by_zip_code(@user_input)
                learn_address
            else
                goodbye 
            end 
    end

    def learn_address
        puts "Would You like to search again?"
        puts "Yes"
        puts "No"
        @user_input = gets.chomp
        case @user_input 
        when "yes"
            menu
        when "no"
            goodbye 
        else 
            puts "Invalid Input"
            learn_address
        end 
    end 
    
    def goodbye 
        puts "Thank you for using Brew! Until next time!"
        exit 
    end 
end 