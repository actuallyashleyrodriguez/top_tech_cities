

class TopTechCities::Cli
    
    def welcome
        puts "\nWelcome to Top Tech Cities! This is a list of the Top cities hiring Tech careers.".green
        puts "Enter the number of the city that you're interested in learning more about.".green
        top_cities
        get_city
        #get_input
        #prints_action
        #until exit
    end

    def top_cities
        @cities = TopTechCities::City.create_from_scrape.map.with_index(1) {|c, idx| p "#{idx}. #{c}"}
        puts "\n Type 'exit' to exit the app\n".red
    end

    def get_city
        select_city = gets.strip.to_i
        city_select = TopTechCities::City.create_from_scrape[select_city - 1]
        puts "\nChoose your option below for #{city_select}\n".yellow
        puts "1. Average Salary".cyan
        puts "2. Top 3 Companies Hiring".cyan
        puts "3. Go back to Main Menu".cyan
        puts "\n Type 'exit' to exit the app\n".red
        if gets.strip == "1"
            puts "\nThe Average Salary for #{city_select} is\n".yellow
            puts "#{TopTechCities::City.salaries[select_city - 1]}".cyan
        elsif gets.strip == "2"
            puts "\nThe Top 3 companies hiring for #{city_select} are\n".yellow
        end
    end
end
