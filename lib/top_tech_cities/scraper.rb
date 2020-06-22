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

  def self.scrape_city_info
    website = Nokogiri::HTML(open("https://www.indeed.com/career-advice/finding-a-job/best-city-for-software-engineers"))
    salaries = []
    salary_info = website.css ("p a")
    salary_info.each do |dollars|
        if dollars.text.include?("$")
            salaries << dollars.text
        end
      end
      puts "#{salaries.drop(1)}".colorize(:cyan)
      companies =[]
      company_info = website.css ("p a")
      company_info.each do |cmp|
        if cmp.attribute("href").value.include?("cmp")
            companies << cmp.text
        end
      end
      puts "#{companies}".colorize(:yellow)
  end
end