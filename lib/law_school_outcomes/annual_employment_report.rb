require "selenium-webdriver"

module LawSchoolOutcomes
  class AnnualEmploymentReport
    attr_accessor :school, :reporting_year

    def initialize(school:, reporting_year:)
      @school = school
      @reporting_year = reporting_year
    end

    def search_term
      "#{@school.name.upcase} EMPLOYMENT SUMMARY FOR #{@reporting_year} GRADUATES"
    end

    def search_results
      return @search_results if @search_results # cache to avoid re-scraping
      driver = Selenium::WebDriver.for(:firefox)
      begin
        driver.navigate.to("http://google.com")
        input = driver.find_element(name: 'q')
        input.send_keys(search_term) # populates search term input element
        input.submit # presses the search button and redirects to a page of search terms
        sleep(2) # give the browser enough time to perform the request/response cycle
        links = driver.find_element(:id, "search").find_elements(:tag_name, "a")
        urls = links.map{|a| a.attribute("href") }
        urls.reject!{|url| url.include?("google.com") || url.include?("googleusercontent.com") || url.include?("javascript:;")} # filter-out google links and javascript voids
      ensure
        @search_results = urls || []
        driver.close
      end
      return @search_results
    end

    def best_guess_url
      #binding.pry
      search_results.find{|url| File.extname(url) == ".pdf" && url.include?(@school.host)}
    end
  end
end
