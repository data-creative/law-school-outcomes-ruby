require "selenium-webdriver"

module LawSchoolOutcomes
  class AnnualEmploymentReport
    def initialize(school:, reporting_year:)
      @school = school
      @reporting_year = reporting_year
    end

    def search_term
      "#{@school.name} EMPLOYMENT SUMMARY FOR #{@reporting_year} GRADUATES"
    end

    def search_results
      begin
        driver = Selenium::WebDriver.for(:firefox)
        driver.navigate.to("http://google.com")
        input = driver.find_element(name: 'q')
        input.send_keys(search_tearm) # populates search term input element
        input.submit # presses the search button and redirects to a page of search terms
        sleep(2) # give the browser enough time to perform the request/response cycle
        links = driver.find_element(:id, "search").find_elements(:tag_name, "a")
        urls = links.map{|a| a.attribute("href") }
        urls.reject!{|href| urls.include?("google.com") || urls.include?("googleusercontent.com") || urls.include?("javascript:;")} # filter-out google links and javascript voids
      ensure
        driver.close
      end
      return urls || []
    end

    def best_guess_report_url(reporting_year)
      urls = search_results(reporting_year)
      urls.find{|url| File.extname(url) == ".pdf" && url.include?(domain)}
    end
  end
end
