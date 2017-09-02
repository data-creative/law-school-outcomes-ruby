require "spec_helper"

describe LawSchoolOutcomes, "version" do
  it "has a version number" do
    expect(LawSchoolOutcomes::VERSION).not_to be nil
  end
end

describe LawSchoolOutcomes, ".get_schools" do
  let(:schools){ described_class.get_schools }
  let(:school_names){ schools.map{|s| s["name"]} }

  # @note currently using the results of a python script which does this
  #it "visits the ABA website to find an updated list of accredited schools" do
  #  pending # expect mock page to include at least 200 schools
  #end

  it "produces a list of schools" do
    expect(schools.count).to be > 200
    expect(schools.first.keys).to match_array(["name", "url", "year"])
    expect(school_names.include?("YALE")).to eql(true)
  end
end

#describe LawSchoolOutcomes, ".find_reports" do
#  let(:results){ described_class.find_reports }
#
#  it "searches the Internet for report URLs" do
#    expect(results.count).to be > 200
#  end
#
#  it "produces search metadata in JSON format" do
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
