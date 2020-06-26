class TopTechCities::City
    attr_accessor :name, :salary, :companies_hiring
@@all =[]
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all 
    end

    def self.create_from_scrape
        TopTechCities::Scraper.scrape_city_name.each do |c|
            self.new(c)
        end
    end

    def self.salaries
        TopTechCities::Scraper.salary_scraped
    end

    def self.top_companies
        TopTechCities::Scraper.company_scraped
    end
   
end