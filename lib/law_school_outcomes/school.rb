require "httparty"
require "domainatrix"
require "active_support/core_ext/hash/keys"

module LawSchoolOutcomes
  class School
    attr_accessor :name, :year, :url

    def initialize(options)
      @name = options[:name]
      @year = options[:year]
      @url = options[:url]
    end

    JSON_SOURCE = "https://raw.githubusercontent.com/data-creative/law-schools-py/master/data/schools.json"

    def self.json_source
      response = HTTParty.get(JSON_SOURCE)
      JSON.parse(response)
    end

    def self.all
      json_source.map{|obj| self.new(obj.symbolize_keys) }
    end

    def parsed_url
      Domainatrix.parse(url)
    end

    def short_name
      parsed_url.domain
    end

    def top_level_domain
      parsed_url.domain_with_public_suffix
    end
  end
end
