require 'spec_helper'
require "pry"

module LawSchoolOutcomes
  RSpec.describe EmploymentSummaryReport do
    describe '#results' do
      let(:report){ create(:employment_summary_report) }

      #before(:each) do
      #end

      it "provides employment summary data" do
        expect(report.results).to eql(mock_results)
      end
    end

    def mock_results
      {:url=>"http://www.law.my-university.edu/some-path/some-report.pdf",
       :school_name=>"my-university",
       :school_info=>
        {:name=>"My University",
         :address=>{:street=>"123 Main Street", :city=>"My City", :state=>"ZZ", :zip=>"10101"},
         :phone=>"123-456-789",
         :website=>"http://www.law.my-university.edu/"},
       :year=>2015,
       :total_grads=>465,
       :employment_outcomes=>
        {:statuses=>
          [{:status=>"Employed - Bar Passage Required", :count=>310},
           {:status=>"Employed - J.D. Advantage", :count=>65},
           {:status=>"Employed - Professional Position", :count=>6},
           {:status=>"Employed - Non-Professional Position", :count=>1},
           {:status=>"Employed - Law School/University Funded", :count=>38},
           {:status=>"Employed - Undeterminable", :count=>0},
           {:status=>"Pursuing Graduate Degree Full Time", :count=>7},
           {:status=>"Unemployed - Start Date Deferred", :count=>3},
           {:status=>"Unemployed - Not Seeking", :count=>4},
           {:status=>"Unemployed - Seeking", :count=>30},
           {:status=>"Employment Status Unknown", :count=>1}],
         :types=>
          [{:type=>"Law Firms (Solo)", :count=>0},
           {:type=>"Law Firms (2 - 10)", :count=>34},
           {:type=>"Law Firms (11 - 25)", :count=>11},
           {:type=>"Law Firms (26 - 50)", :count=>6},
           {:type=>"Law Firms (51 - 100)", :count=>14},
           {:type=>"Law Firms (101 - 250)", :count=>15},
           {:type=>"Law Firms (251 - 500)", :count=>25},
           {:type=>"Law Firms (501 +)", :count=>109},
           {:type=>"Law Firms (Unknown Size)", :count=>1},
           {:type=>"Business & Industry", :count=>51},
           {:type=>"Government", :count=>79},
           {:type=>"Pub. Int.", :count=>40},
           {:type=>"Clerkships - Federal", :count=>16},
           {:type=>"Clerkships - State & Local", :count=>13},
           {:type=>"Clerkships - Other", :count=>2},
           {:type=>"Education", :count=>4},
           {:type=>"Employer Type Unknown", :count=>0}],
         :locations=>
          [{:type=>"State - Largest Employment", :location=>"District Of Columbia", :count=>"221"},
           {:type=>"State - 2nd Largest Employment", :location=>"New York", :count=>"58"},
           {:type=>"State - 3rd Largest Employment", :location=>"Virginia", :count=>"32"},
           {:type=>"Employed in Foreign Countries", :location=>"Employed in Foreign Countries", :count=>8}]}}
    end
  end
end
