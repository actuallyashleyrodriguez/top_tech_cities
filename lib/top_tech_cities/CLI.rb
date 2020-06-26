

class TopTechCities::Cli
    
    def welcome
        puts "\nWelcome to Top Tech Cities! This is a list of the Top cities hiring Tech careers.".green
        top_cities
        get_city
        #get_input
        #prints_action
        #until exit
    end

    def top_cities
        puts "Enter the number of the city that you're interested in learning more about.".green
        @cities = TopTechCities::City.create_from_scrape.map.with_index(1) {|c, idx| p "#{idx}. #{c}"}
        puts "\n Type 'exit' to exit the app\n".red
    end

    def get_city
        select_city = gets.strip.to_i
        city_select = TopTechCities::City.create_from_scrape[select_city - 1]
        puts "\nChoose your option below for #{city_select}\n".yellow
        city_menu
        case gets.strip
        when "1"
            puts "\nThe Average Salary for #{city_select} is\n".colorize(:dark_gray)
            puts "#{TopTechCities::City.salaries[select_city - 1]}".colorize(:light_magenta)
        when "2"
            puts "\nThe Top 3 companies hiring for #{city_select} are\n".yellow
            puts "#{TopTechCities::City.top_companies[select_city - 1]}\n".colorize(:light_magenta)
        when "3"
            top_cities
        when "e" || "exit"
            puts "Happy Job Hunting!"
        else
            puts "That's not a valid input!".colorize(:blink)
        end
    end

    def city_menu
        puts "\n1. Average Salary".cyan
        puts "2. Top 3 Companies Hiring".cyan
        puts "3. Go back to Main Menu".cyan
        puts "\n Type 'exit' to exit the app\n".red
    end
end
