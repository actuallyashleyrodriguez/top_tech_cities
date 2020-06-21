

class TopTechCities::Cli
    
    def welcome
        puts "Welcome to Top Tech Cities! This is a list of the Top cities hiring Tech careers.".green
        puts "Enter the number of the city, or the city name, that you're interested in learning more about.".green
        #get_cities
        #enter which city
        #cities_information (about, salary,jobs)
        #decide action
        #prints action
        TopTechCities::Scraper.scrape_city_name
    end
end