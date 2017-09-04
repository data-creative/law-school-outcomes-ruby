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


  def self.find_report(school:, year:)
    driver = Selenium::WebDriver.for(:firefox)
    driver.navigate.to("http://google.com")
    #input = driver.find_element(name: 'q')
    #search_tearm = "#{school[:name]} EMPLOYMENT SUMMARY FOR #{year} GRADUATES"
    #input.send_keys(search_tearm) # populates search term input element
    #input.submit # presses the search button and redirects to a page of search terms

    # todo: gather search result urls
    #binding.pry

    driver.close
    return {school: school, year: year, search_results: []}
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
