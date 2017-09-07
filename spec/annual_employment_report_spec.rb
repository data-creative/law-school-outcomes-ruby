require "spec_helper"

describe LawSchoolOutcomes::AnnualEmploymentReport do
  let(:school){ LawSchoolOutcomes::School.new(name: "AKRON", url: "http://www.uakron.edu/law") }
  let(:annual_report){ described_class.new(school: school, reporting_year: 2016) }
  let(:search_results){
    [
      "https://www.uakron.edu/law/admissions/docs/EmploymentQuestionnaireSummary.pdf",
      "https://www.uakron.edu/law/docs/2017-08-24.employment-report-nalp.pdf",
      "http://law.nd.edu/assets/232629/aba_employment_questionnaire_summary_class_of_2016.pdf",
      "https://lawschooltuitionbubble.wordpress.com/2017/05/15/class-of-2016-employment-report-corrected/",
      "http://employmentsummary.abaquestionnaire.org/",
      "https://en.wikipedia.org/wiki/University_of_Dayton_School_of_Law",
      "https://www.liquidcompass.com/job/7717738/rn-behavioral-health",
      "http://www.akronschools.com/school/Buchtel+CLC+9-12/latest-updates-on-graduation-requirements-2",
      "http://www.conxusneo.jobs/news/2016-state-of-the-akron-public-schools-speech.aspx"
    ]
  }

  describe "#search_term" do
    it "is most likely to produce a successful search" do
      expect(annual_report.search_term).to eql("AKRON EMPLOYMENT SUMMARY FOR 2016 GRADUATES")
    end
  end

  describe "#search_results" do
    it "performs a google search and returns all first-page url results" do
      allow(annual_report).to receive(:search_results).and_return(search_results)
      urls = annual_report.search_results
      expect(urls.any?).to eql(true)
    end
  end
end
