class TopTechCities::Scraper
    
  ##iterates through the h3 headers, and returns an array of the cities
  def self.scrape_city_name
    cities = []
    website = Nokogiri::HTML(open("https://www.indeed.com/career-advice/finding-a-job/best-city-for-software-engineers"))
    city_name = website.css("h3 a")
     city_name.each do |city|
        if city.text.include?(",")
            cities << city.text ## how to get this to read City.new(city.text)
      end
      end
      cities
  end

  #iterates through the salaries and removes the first one which isnt linked to a city
  def self.salary_scraped 
    website = Nokogiri::HTML(open("https://www.indeed.com/career-advice/finding-a-job/best-city-for-software-engineers"))
    salaries = []
    salary_info = website.css ("p a")
    salary_info.each do |dollars|
        if dollars.text.include?("$")
           salaries << dollars.text # how can I get this to be City.Salary?
        end
      end
      salaries.drop(1)
    end
#iterates through the companies and inserts them in a nested array 3 per city
    def self.company_scraped
        website = Nokogiri::HTML(open("https://www.indeed.com/career-advice/finding-a-job/best-city-for-software-engineers"))
      companies =[] #hash instead?
      company_info = website.css ("p a")
      company_info.each do |cmp|
        if cmp.attribute("href").value.include?("cmp")
           companies << cmp.text 
        end
      end
      nested_array = [] #hash instead?
      companies.each_slice(3) {|n| nested_array << n}
      nested_array #how to iterate through the nested array and make every three related to a City
  end
end