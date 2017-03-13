require 'spec_helper'

module LawSchoolOutcomes
  RSpec.describe EmploymentSummaryReport do
    describe '#results' do
      let(:year){ 2015 }
      let(:url){ "http://www.law.my-university.edu/some-path/some-report.pdf" }
      let(:report){ described_class.new(year: year, url: url) }

      before(:each) do
        allow_any_instance_of(described_class).to receive(:read_lines).and_return(mock_pdf_lines)
      end

      it "provides employment summary data" do
        expect(report.results).to eql(mock_results)
      end
    end

    def mock_pdf_lines
      [
        "My University",
        "123 Main Street",
        "Phone : 123-456-7890",
        "My City, ZZ 10101",
        "Website : http://www.law.my-university.edu",
        "EMPLOYMENT SUMMARY FOR 2015 GRADUATES",
        "EMPLOYMENT STATUS                               FULL TIME     FULL TIME     PART TIME     PART TIME      NUMBER",
        "LONG TERM    SHORT TERM    LONG TERM     SHORT TERM",
        "Employed - Bar Passage Required                     301            3             4            2            310",
        "Employed - J.D. Advantage                           55             5             1            4             65",
        "Employed - Professional Position                     3             1             1            1             6",
        "Employed - Non-Professional Position                 1             0             0            0             1",
        "Employed - Law School/University Funded              8            29             0            1             38",
        "Employed - Undeterminable                            0             0             0            0             0",
        "Pursuing Graduate Degree Full Time                                                                          7",
        "Unemployed - Start Date Deferred                                                                            3",
        "Unemployed - Not Seeking                                                                                    4",
        "Unemployed - Seeking                                                                                        30",
        "Employment Status Unknown                                                                                   1",
        "Total Graduates                                                                                            465",
        "EMPLOYMENT TYPE                                 FULL TIME     FULL TIME     PART TIME     PART TIME      NUMBER",
        "LONG TERM    SHORT TERM    LONG TERM     SHORT TERM",
        "Law Firms",
        "Solo                                             0             0             0            0             0",
        "2 - 10                                          28             2             2            2             34",
        "11 - 25                                         10             1             0            0             11",
        "26 - 50                                          5             0             0            1             6",
        "51 - 100                                        12             1             1            0             14",
        "101 - 250                                       15             0             0            0             15",
        "251 - 500                                       25             0             0            0             25",
        "501 +                                           109            0             0            0            109",
        "Unknown Size                                     1             0             0            0             1",
        "Business & Industry                                 40             7             2            2             51",
        "Government                                          68            11             0            0             79",
        "Pub. Int.                                           23            16             0            1             40",
        "Clerkships - Federal                                16             0             0            0             16",
        "Clerkships - State & Local                          13             0             0            0             13",
        "Clerkships - Other                                   2             0             0            0             2",
        "Education                                            1             0             1            2             4",
        "Employer Type Unknown                                0             0             0            0             0",
        "Total                                               368           38             6            8            420",
        "LAW SCHOOL/UNIVERSITY FUNDED POSITIONS           FULL TIME    FULL TIME     PART TIME     PART TIME      NUMBER",
        "LONG TERM    SHORT TERM     LONG TERM    SHORT TERM",
        "Employed - Bar Passage Required                      6             19            0             0            25",
        "Employed - J.D. Advantage                            2             10            0             1            13",
        "Employed - Professional Position                     0             0             0             0             0",
        "Employed - Non-Professional Position                 0             0             0             0             0",
        "Total Employed by Law School/University              8             29            0             1            38",
        "EMPLOYMENT LOCATION                                          STATE                                       NUMBER",
        "State - Largest Employment                                   District Of Columbia                          221",
        "State - 2nd Largest Employment                               New York                                       58",
        "State - 3rd Largest Employment                               Virginia                                       32",
        "Employed in Foreign Countries                                                                               8"
      ]
    end

    def mock_results
      {:url=>"http://www.law.my-university.edu/some-path/some-report.pdf",
       :school_name=>"my-university",
       :school_info=>
        {:name=>"My University",
         :address=>{:street=>"123 Main Street", :city=>"My City", :state=>"ZZ", :zip=>"10101"},
         :phone=>"123-456-7890",
         :website=>"http://www.law.my-university.edu"},
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
