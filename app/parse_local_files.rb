
require "pry"
require_relative "../lib/law_school_outcomes/employment_summary_report"

year = 2016
dir = File.expand_path("../../reports/#{year}/", __FILE__)
entries = Dir.entries(dir)
entries.reject!{|entry| [".", "..", ".gitignore"].include?(entry)}
entries.each do |entry|
  file_path = File.join(dir, entry)
  puts entry
end
