

class TopTechCities::Cli
    
    def welcome
        puts "Welcome to Top Tech Cities! This is a list of the Top cities hiring Tech careers.".green
        puts "Enter the number of the city that you're interested in learning more about.".green
        top_cities
        get_city
        #get_input
        #cities_information_menu(salary,companies)
        #get_input
        #prints_action
        #until exit
    end

    def top_cities
        @cities = TopTechCities::City.create_from_scrape.map.with_index(1) {|c, idx| p "#{idx}. #{c}"}
    end

    def get_city
        select_city = gets.strip.to_i
        city_select = TopTechCities::City.create_from_scrape[select_city - 1]
        puts "Choose your option below for #{city_select}".yellow
        puts "1. Average Salary".cyan
        puts "2. Top 3 Companies Hiring".cyan
    end
end
