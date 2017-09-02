# Law School Outcomes - Ruby

## Installation

```shell
gem install law_school_outcomes
```

## Usage

Get a list of ABA-approved law schools:

```ruby
schools = LawSchoolOutcomes.get_schools
schools.first #> {uuid: "78", name: "MY UNIVERSITY", url: "http://www.law.my-university.edu/"}
```

Search the Internet for PDF-formatted "Employment Summary Reports" hosted on the university's domain, then note the url (or possible urls):

```ruby
LawSchoolOutcomes.find_reports
```

Download all reports (if desired):

```ruby
LawSchoolOutcomes.download_reports
```

Parse all reports:

```ruby
LawSchoolOutcomes.parse_reports
```

## [Contributing](/CONTRIBUTING.md)

## [License](/LICENSE)
