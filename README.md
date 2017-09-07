# Law School Outcomes - Ruby

## Installation

```shell
gem install law_school_outcomes
```

## Usage

Get a list of ABA-approved law schools:

```ruby
schools = LawSchoolOutcomes::School.all
schools.first #> {name: "MY UNIVERSITY", url: "http://www.law.my-university.edu/", year: 1942}
```

Search the Internet for annual "Employment Summary Reports" hosted by the university, and allow a user to accept (confirm) or reject a url:

```ruby
schools.each do |school|
  (2010..2016).to_a.each do |reporting_year|
    annual_report = LawSchoolOutcomes::AnnualEmploymentReport(school: school, reporting_year: reporting_year)

    annual_report.search_results # search for results
    annual_report.confirm_url("some-url") # writes to file
  end
end
```

## [Contributing](/CONTRIBUTING.md)

## [License](/LICENSE)
