
require "pry"
require_relative "../lib/law_school_outcomes/employment_summary_report"

year = 2016
dir = File.expand_path("../../reports/#{year}/", __FILE__)
entries = Dir.entries(dir)
entries.reject!{|entry| [".", "..", ".gitignore", ".DS_Store"].include?(entry)}
entries.each do |entry|
  file_path = File.join(dir, entry)
  puts entry

  #binding.pry
  #io = file_path
  #reader = PDF::Reader.new(io)

  report = LawSchoolOutcomes::EmploymentSummaryReport.new(year: year, path: file_path)
  puts report.school_info, report.total_grads
end
