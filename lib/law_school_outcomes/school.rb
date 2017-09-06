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
      @json_source ||= HTTParty.get(JSON_SOURCE)
    end

    def self.all
      JSON.parse(json_source).map{|obj| self.new(obj.symbolize_keys) }
    end

    def self.all_domains
      @all_domains ||= self.all.map{|school| school.domain }
    end

    def self.duplicate_domains
      all_domains.select{|domain| all_domains.count(domain) > 1}.uniq #> ["psu", "widener"]
    end

    def parsed_url
      Domainatrix.parse(url)
    end

    def domain
      parsed_url.domain
    end

    def subdomain
      parsed_url.subdomain
    end

    def host
      parsed_url.host
    end

    def short_name
      self.class.duplicate_domains.include?(domain) ? subdomain : domain
    end

    #def top_level_domain
    #  parsed_url.domain_with_public_suffix
    #end
  end
end
