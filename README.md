# Law School Outcomes - Ruby

Law schools accredited by the American Bar Association (ABA) publish in a standardized PDF format reports of employment outcomes for recent graduates.

Use the `law_school_outcomes` ruby library to process these PDF files into memory for further use.

## Installation

```` sh
gem install law_school_outcomes
````

Else if using a Gemfile: insert `gem 'law_school_outcomes'` and run `bundle install`.

## Usage

#### Employment Summary Reports

Google search "[SCHOOL NAME] EMPLOYMENT SUMMARY FOR [year] GRADUATES" to find an Employment Summary Report hosted in PDF format. Note its url and year.

Given the report's url and year, read its contents into memory:

```` rb
require 'law_school_outcomes'

report = EmploymentSummaryReport.new(year: 2015, url: "http://www.law.my-university.edu/some-random-path/some-report.pdf")

report.school_info
#> {:name=>"MY UNIVERSITY", :address=>{:street=>"123 MAIN STREET", :city=>"MY CITY", :state=>"ZZ", :zip=>"10101"}, :phone=>"123-456-789", :website=>"http://www.law.my-university.edu/"}

report.total_grads #> 465

report.employment_status_results
#> [{:status=>"Employed - Bar Passage Required", :count=>310},
#   {:status=>"Employed - J.D. Advantage", :count=>65},
#   {:status=>"Employed - Professional Position", :count=>6},
#   {:status=>"Employed - Non-Professional Position", :count=>1},
#   {:status=>"Employed - Law School/University Funded", :count=>38},
#   {:status=>"Employed - Undeterminable", :count=>0},
#   {:status=>"Pursuing Graduate Degree Full Time", :count=>7},
#   {:status=>"Unemployed - Start Date Deferred", :count=>3},
#   {:status=>"Unemployed - Not Seeking", :count=>4},
#   {:status=>"Unemployed - Seeking", :count=>30},
#   {:status=>"Employment Status Unknown", :count=>1
#  }]

report.employment_type_results
#> [{:type=>"Law Firms (Solo)", :count=>0},
#   {:type=>"Law Firms (2 - 10)", :count=>34},
#   {:type=>"Law Firms (11 - 25)", :count=>11},
#   {:type=>"Law Firms (26 - 50)", :count=>6},
#   {:type=>"Law Firms (51 - 100)", :count=>14},
#   {:type=>"Law Firms (101 - 250)", :count=>15},
#   {:type=>"Law Firms (251 - 500)", :count=>25},
#   {:type=>"Law Firms (501 +)", :count=>109},
#   {:type=>"Law Firms (Unknown Size)", :count=>1},
#   {:type=>"Business & Industry", :count=>51},
#   {:type=>"Government", :count=>79},
#   {:type=>"Pub. Int.", :count=>40},
#   {:type=>"Clerkships - Federal", :count=>16},
#   {:type=>"Clerkships - State & Local", :count=>13},
#   {:type=>"Clerkships - Other", :count=>2},
#   {:type=>"Education", :count=>4},
#   {:type=>"Employer Type Unknown", :count=>0}]

report.employment_location_results
#> [{:type=>"State - Largest Employment",
#    :location=>"District Of Columbia",
#    :count=>"221"},
#   {:type=>"State - 2nd Largest Employment",
#    :location=>"New York",
#    :count=>"58"},
#   {:type=>"State - 3rd Largest Employment",
#    :location=>"Virginia",
#    :count=>"32"},
#   {:type=>"Employed in Foreign Countries",
#    :location=>"Employed in Foreign Countries",
#    :count=>8}]

# etc...
````

## [Contributing](/CONTRIBUTING.md)

## [License](/LICENSE)
