require "spec_helper"

#describe LawSchoolOutcomes, ".best_guess" do
#  let(:urls){
#    [
#      "http://asl.edu/wp-content/uploads/2015/08/EmploymentSummary-2016.pdf",
#      "https://law.vanderbilt.edu/2016-EmploymentSummary.pdf",
#      "http://employmentsummary.abaquestionnaire.org/",
#      "https://lawschooltuitionbubble.wordpress.com/2017/05/15/class-of-2016-employment-report-corrected/",
#      "https://www.usnews.com/best-colleges/appalachian-state-2906",
#      "http://abovethelaw.com/2015/08/this-law-schools-enrollment-is-down-by-almost-80-percent/",
#      "http://www.collegedata.com/cs/data/college/college_pg01_tmpl.jhtml?schoolId=476",
#      "https://www.arc.gov/research/ResearchReports.asp?F_Category=7",
#      "https://www.arc.gov/images/grantsandfunding/POWER2016/POWER2016_Awards_WHFactSheet_8-24-2016.pdf"
#    ]
#  }
#
#  it "should return the first url which is hosted by the school and is a PDF file" do
#    expect(described_class.best_guess(urls)).to eql("http://asl.edu/wp-content/uploads/2015/08/EmploymentSummary-2016.pdf")
#  end
#end

#describe LawSchoolOutcomes, ".possible_report_urls" do
#  let(:school){ {name: "APPALACHIAN", url: "http://www.asl.edu/"} }
#  let(:reporting_year){ 2016 }
#  let(:results){ described_class.find_report(school: school, reporting_year: reporting_year) } #todo: mock
#  let(:urls){
#    [
#      "http://asl.edu/wp-content/uploads/2015/08/EmploymentSummary-2016.pdf",
#      "https://law.vanderbilt.edu/2016-EmploymentSummary.pdf",
#      "http://employmentsummary.abaquestionnaire.org/",
#      "https://lawschooltuitionbubble.wordpress.com/2017/05/15/class-of-2016-employment-report-corrected/",
#      "https://www.usnews.com/best-colleges/appalachian-state-2906",
#      "http://abovethelaw.com/2015/08/this-law-schools-enrollment-is-down-by-almost-80-percent/",
#      "http://www.collegedata.com/cs/data/college/college_pg01_tmpl.jhtml?schoolId=476",
#      "https://www.arc.gov/research/ResearchReports.asp?F_Category=7",
#      "https://www.arc.gov/images/grantsandfunding/POWER2016/POWER2016_Awards_WHFactSheet_8-24-2016.pdf"
#    ]
#  }
#
#  it "searches the Internet for potential report URLs" do
#    expect(results).to eql(urls)
#  end
#end

#describe LawSchoolOutcomes, ".find_reports" do
#  it "searches the Internet for report URLs" do
#    pending
#  end
#end

#describe LawSchoolOutcomes, ".download_reports" do
#  it "downloads PDF-formatted reports from all report URLs" do
#    pending
#  end
#end

#describe LawSchoolOutcomes, ".parse_reports" do
#  it "transforms PDF-formatted reports into summary data in JSON format" do
#    pending
#  end
#end
