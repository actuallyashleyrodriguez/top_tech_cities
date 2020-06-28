

class TopTechCities::Cli
    
    def run_app
        if gets.strip != "exit"
        puts "\nWelcome to Top Tech Cities! This is a list of the Top cities hiring Tech careers.".green
        puts top_cities
        puts get_city
        else
            exit_app
        end
    end

    def top_cities
        puts "Enter the number of the city that you're interested in learning more about.\n".green 
        @cities = TopTechCities::City.all.map.with_index(1) {|c, idx| p "#{idx}. #{c.name}"}
        puts "\n Type 'exit' to exit the app\n".red
    end

    def get_city
        #until gets.strip == "e" || "exit"
        select_city = gets.strip.to_i
        city_select = TopTechCities::City.all[select_city - 1]
        puts "\nChoose your option below for #{city_select}\n".cyan
        city_menu
        case gets.strip
        when "1"
            puts "\nThe Average Salary for #{city_select} is\n".colorize(:green)
            puts "#{TopTechCities::City.salaries[select_city - 1]}\n".colorize(:green)
        when "2"
            puts "\nThe Top 3 companies hiring for #{city_select} are\n".cyan
            puts "#{TopTechCities::City.top_companies[select_city - 1]}\n".colorize(:yellow)
        when "3"
            top_cities
        else
            puts "\nThat's not a valid input!\n".red
        end
        #recursion. how?
    end

    def user_input
        gets.strip
    end


    def valid_input
        validate get_city
    end

    def city_menu
        puts "\n1. Average Salary".colorize(:light_magenta)
        puts "2. Top 3 Companies Hiring".colorize(:light_magenta)
        puts "3. Go back to Main Menu".colorize(:light_magenta)
        puts "\n Type 'exit' to exit the app\n".red
    end

    def exit_app
        puts "Happy Job Hunting!".green
    end
end
