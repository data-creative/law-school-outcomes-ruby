FactoryGirl.define do
  factory :employment_summary_report, class: LawSchoolOutcomes::EmploymentSummaryReport do
    url "http://www.law.my-university.edu/some-path/some-report.pdf"
    year  "2015"
  end
end
