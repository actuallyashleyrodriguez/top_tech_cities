

class TopTechCities::Cli
    
    def run_app
        puts "\nWelcome to Top Tech Cities! This is a list of the Top cities hiring Tech careers.".green
        top_cities
        get_city
    end

    def top_cities
        puts "Enter the number of the city that you're interested in learning more about.\n".green 
        @cities = TopTechCities::City.all.map.with_index(1) {|c, idx| p "#{idx}. #{c.name}"}
    end

    def get_city
        select_city = gets.strip.to_i
        city_select = TopTechCities::City.all[select_city - 1].name
        if valid_input(select_city)
            puts "\nChoose your option below for #{city_select}\n".colorize(:light_magenta)
            city_menu
            case user_input
            when "1"
                puts "\nThe Average Salary for #{city_select} is\n".colorize(:yellow)
                puts "#{TopTechCities::City.salaries[select_city - 1]}\n".colorize(:yellow)
            when "2"
                puts "\nThe Top 3 companies hiring for #{city_select} are\n".cyan
                puts "1. #{TopTechCities::City.top_companies[select_city - 1][0]}\n".colorize(:cyan)
                puts "2. #{TopTechCities::City.top_companies[select_city - 1][1]}\n".colorize(:cyan)
                puts "3. #{TopTechCities::City.top_companies[select_city - 1][2]}\n".colorize(:cyan)
            when "3"
            when "exit"
                exit_app
            else
                puts "\nThat's not a valid input!\n".red
            end
        else
            puts "\nThat's not a valid input!\n".red
        end
        top_cities 
        get_city 
    end

    def user_input
        gets.strip.downcase
    end


    def valid_input(input)
        input <= TopTechCities::City.all.length && input = 0
    end

    def city_menu
        puts "\n1. Average Salary".colorize(:light_magenta)
        puts "2. Top 3 Companies Hiring".colorize(:light_magenta)
        puts "3. Go back to Main Menu".colorize(:light_magenta)
        puts "\n Type 'exit' to exit the app\n".red
    end

    def exit_app
        puts "Happy Job Hunting!".green
        exit!
    end
end
