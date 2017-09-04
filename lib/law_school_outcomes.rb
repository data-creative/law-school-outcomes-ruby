require "law_school_outcomes/version"

require "httparty"
require "selenium-webdriver"
require "pry"

module LawSchoolOutcomes
  def self.get_schools
    url = "https://raw.githubusercontent.com/data-creative/law-schools-py/master/data/schools.json"
    response = HTTParty.get(url)
    parsed_response = JSON.parse(response)
    return parsed_response
  end


  def self.find_report(school:, reporting_year:)
    driver = Selenium::WebDriver.for(:firefox)
    driver.navigate.to("http://google.com")

    begin
      input = driver.find_element(name: 'q')
      search_tearm = "#{school[:name]} EMPLOYMENT SUMMARY FOR #{reporting_year} GRADUATES"
      input.send_keys(search_tearm) # populates search term input element
      input.submit # presses the search button and redirects to a page of search terms

      sleep(2) # give the browser enough time to perform the request/response cycle

      links = driver.find_element(:id, "search").find_elements(:tag_name, "a")
      hrefs = links.map{|a| a.attribute("href") }
      hrefs.reject!{|href| href.include?("google.com") || href.include?("googleusercontent.com") || href.include?("javascript:;")} # filter-out google links and javascript voids

      #binding.pry
      best_guess = "" # todo: get first school-domain-hosted url ending with .pdf
    ensure
      driver.close

      return {
        school: school,
        reporting_year: reporting_year,
        search_results: {
          best_guess: best_guess || "N/A - ERROR",
          hrefs: hrefs || []
        }
      }
    end
  end

  #def self.find_reports
  #  schools = get_schools
  #  schools.each do |school|
  #    # to stuff
  #  end
  #end

  #def self.download_reports
  #  #code
  #end

  #def self.parse_reports
  #  #code
  #end
end
