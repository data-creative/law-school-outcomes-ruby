require "spec_helper"

describe LawSchoolOutcomes::School, ".all" do
  let(:schools){ described_class.all }
  let(:school_names){ schools.map{|s| s.name} }

  before do
    allow(described_class).to receive(:json_source).and_return(
      [
        {"name": "AKRON", "year": 1961, "url": "http://www.uakron.edu/law"},
        {"name": "ALABAMA", "year": 1926, "url": "http://www.law.ua.edu/"},
        {"name": "WIDENER-DELAWARE", "year": 1975, "url": "http://delawarelaw.widener.edu/"},
        {"name": "WIDENER-COMMONWEALTH", "year": 1988, "url": "http://commonwealthlaw.widener.edu/"},
        {"name": "WILLIAM AND MARY", "year": 1932, "url": "http://law.wm.edu"},
        {"name": "YALE", "year": 1923, "url": "http://www.law.yale.edu/"}
      ]
    )
  end

  it "produces an updated list of ABA-accredited schools" do
    expect(schools.count).to eql(6)
    expect(schools.first.class).to eql(described_class)
    expect(schools.first.instance_variables).to match_array([:@name, :@year, :@url])
    expect(school_names.include?("YALE")).to eql(true)
  end
end

describe LawSchoolOutcomes::School, "#short_name" do
  let(:school){ described_class.new(name: "My Law School", url: "http://law.my-school.edu/") }

  it "provides a clean, space-less, abbreviated name" do
    expect(school.short_name).to eql("my-school")
  end

  it "proxies as a unique identifier" do
    mock_schools_path = File.expand_path("../mock/schools.json", __FILE__)
    local_source = File.read(mock_schools_path)
    allow(described_class).to receive(:json_source).and_return(local_source)

    schools = described_class.all
    short_names = schools.map{|school| school.short_name }
    expect(short_names.uniq.count).to eql(schools.count)
  end
end
