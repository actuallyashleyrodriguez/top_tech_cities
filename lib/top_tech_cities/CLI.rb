

class TopTechCities::Cli
    
    def welcome
        puts "Welcome to Top Tech Cities! This is a list of the Top cities hiring Tech careers.".green
        puts "Enter the number of the city, or the city name, that you're interested in learning more about.".green
        index_cities
        #enter which city
        #cities_information (about, salary,jobs)
        #decide action
        #prints action
    end

    def index_cities
        TopTechCities::City.create_from_scrape.map.with_index(1) {|c, idx| p "#{idx}. #{c}"}
    end
end
