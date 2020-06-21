class TopTechCities::Scraper
    
  def self.scrape_city_name
    cities = []
    website = Nokogiri::HTML(open("https://www.indeed.com/career-advice/finding-a-job/best-city-for-software-engineers"))
    city_name = website.css("h3 a")
     city_name.each do |city|
        if city.text.include?(",")
         puts city.text
      end
      end
      cities
  end

  def self.scrape_salaries
  end
end