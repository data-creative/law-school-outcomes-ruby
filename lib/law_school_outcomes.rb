require "law_school_outcomes/version"

require "httparty"
#require "pry"

module LawSchoolOutcomes
  def self.get_schools
    #url = "https://raw.githubusercontent.com/data-creative/law-schools-py/master/data/schools_alt.json" # this version has UUIDs, but no matching identifier to tie them to the other file, so perhaps some kind of name and/or order matching can be done (later). for now domains can serve as the school's unique identifiers - they are more contextual than numbers anyway.
    url = "https://raw.githubusercontent.com/data-creative/law-schools-py/master/data/schools.json"
    response = HTTParty.get(url)
    parsed_response = JSON.parse(response)
    return parsed_response
  end

  def self.find_reports
    #code
  end

  def self.download_reports
    #code
  end

  def self.parse_reports
    #code
  end
end
