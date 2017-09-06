require "spec_helper"

describe LawSchoolOutcomes::School, ".all" do
  let(:schools){ described_class.all } # todo: mock
  let(:school_names){ schools.map{|s| s["name"]} }

  it "produces an updated list of ABA-accredited schools" do
    expect(schools.count).to be > 200
    expect(schools.first.keys).to match_array(["name", "url", "year"])
    expect(school_names.include?("YALE")).to eql(true)
  end
end

describe LawSchoolOutcomes, ".school_domain" do
  let(:url){ "http://law.my-school.edu/" }

  it "should not necessarily assume the report is hosted on 'law.' subdomains" do
    expect(described_class.school_domain(url)).to eql("my-school.edu")
  end
end
