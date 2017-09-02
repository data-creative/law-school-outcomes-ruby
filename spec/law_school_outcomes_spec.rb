require "spec_helper"

describe LawSchoolOutcomes, "version" do
  it "has a version number" do
    expect(LawSchoolOutcomes::VERSION).not_to be nil
  end
end

describe LawSchoolOutcomes, ".get_schools" do
  it "visits the ABA website to find an updated list of accredited schools" do
    pending
  end

  it "produces a list of schools in CSV format" do
    pending
  end
end

describe LawSchoolOutcomes, ".find_reports" do
  it "searches the Internet for report URLs" do
    pending
  end

  it "produces search metadata in JSON format" do
    pending
  end
end

describe LawSchoolOutcomes, ".download_reports" do
  it "downloads PDF-formatted reports from all report URLs" do
    pending
  end
end

describe LawSchoolOutcomes, ".parse_reports" do
  it "transforms PDF-formatted reports into summary data in JSON format" do
    pending
  end
end
