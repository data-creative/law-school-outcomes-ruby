require "spec_helper"

describe LawSchoolOutcomes::AnnualEmploymentReport do
  #let(:school){ LawSchoolOutcomes::School.new(name: "AKRON", url: "http://www.uakron.edu/law") }
  #let(:annual_report){ described_class.new(school: school, reporting_year: 2015) }
  #let(:search_results){
  #  [
  #    "https://www.uakron.edu/law/admissions/docs/EmploymentQuestionnaireSummary.pdf",
  #    "https://www.uakron.edu/law/docs/2017-08-24.employment-report-nalp.pdf",
  #    "http://law.nd.edu/assets/232629/aba_employment_questionnaire_summary_class_of_2016.pdf",
  #    "https://lawschooltuitionbubble.wordpress.com/2017/05/15/class-of-2016-employment-report-corrected/",
  #    "http://employmentsummary.abaquestionnaire.org/",
  #    "https://en.wikipedia.org/wiki/University_of_Dayton_School_of_Law",
  #    "https://www.liquidcompass.com/job/7717738/rn-behavioral-health",
  #    "http://www.akronschools.com/school/Buchtel+CLC+9-12/latest-updates-on-graduation-requirements-2",
  #    "http://www.conxusneo.jobs/news/2016-state-of-the-akron-public-schools-speech.aspx"
  #  ]
  #}
  let(:school){ LawSchoolOutcomes::School.new(name: "NEW YORK UNIVERSITY", url: "http://www.law.nyu.edu/") }
  let(:annual_report){ described_class.new(school: school, reporting_year: 2014) }
  let(:search_results){
    [
      "https://www.nyu.edu/content/dam/nyu/wasserman/documents/Life-Beyond-the-Square-Survey-2014.pdf",
      "http://www.law.nyu.edu/careerservices/employmentstatistics",
      "http://www.law.nyu.edu/sites/default/files/NYULawABAReportEmploymentSummary2014Graduates.pdf",
      "http://www.alumni.nyu.edu/s/1068/alumni/home.aspx?sid=1068&gid=1&pgid=6&cid=41",
      "https://www.law.uconn.edu/sites/default/files/content-page/Graduate%20Employment%20Outcomes%20Class%20of%202014.pdf",
      "https://www.law.umich.edu/careers/classstats/Documents/ABASummaryClassof2014.pdf",
      "https://www.law.umn.edu/career-center/2015-career-facts-statistics/2014-career-facts-statistics",
      "http://career.uga.edu/outcomes",
      "http://law.hofstra.edu/directory/departments/careerservices/employmentstatistics/classof2014/index.html",
      "https://en.wikipedia.org/wiki/New_York_University_School_of_Law"
    ]
  }
  let(:confirmed_url){ "http://www.law.nyu.edu/sites/default/files/NYULawABAReportEmploymentSummary2014Graduates.pdf" }

  describe "#search_term" do
    it "is most likely to produce a successful search" do
      expect(annual_report.search_term).to eql("NEW YORK UNIVERSITY EMPLOYMENT SUMMARY FOR 2014 GRADUATES")
    end
  end

  describe "#search_results" do
    it "performs a google search and returns all first-page url results" do
      allow(annual_report).to receive(:search_results).and_return(search_results)
      expect(annual_report.search_results.any?).to eql(true)
    end
  end

  describe "#best_guess_url" do
    it "tries to determine which search result links to the annual report" do
      allow(annual_report).to receive(:search_results).and_return(search_results)
      expect(annual_report.best_guess_url).to eql(confirmed_url)
    end
  end
end
