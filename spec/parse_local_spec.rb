require 'spec_helper'
require "pry"

module LawSchoolOutcomes
  RSpec.describe EmploymentSummaryReport, "local file" do
    describe '#results' do
      let(:year){ 2016 }
      let(:file_path){ "___________" }
      let(:report){ described_class.new(year: year, path: file_path) }

      #dir = File.expand_path("../../reports/#{year}/", __FILE__)
      #entries = Dir.entries(dir)
      #entries.reject!{|entry| [".", "..", ".gitignore"].include?(entry)}
      #entries.each do |entry|
      #  file_path = File.join(dir, entry)
      #  puts entry
      #  report = LawSchoolOutcomes::EmploymentSummaryReport.new(year: year, path: file_path)
      #  puts report.school_info, report.total_grads
      #end

      it "provides employment summary data" do
        expect(report.results).to eql(mock_results)
      end
    end
end
