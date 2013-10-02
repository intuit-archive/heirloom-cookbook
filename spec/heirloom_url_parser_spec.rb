require File.expand_path("../", __FILE__) + '/spec_helper'

describe HeirloomURLParser do
  it "should error when no arguments are passed" do
    expect {
      HeirloomURLParser.new
    }.to raise_error ArgumentError
  end
  
  before do
    @parser = HeirloomURLParser.new('s3://bucket-prefix-us-southeast-1/lc/c89204.tar.gz')
  end

  it "should return id" do
    expect(@parser.id).to eq("c89204")
  end

  it "should return bucket_prefix" do
    expect(@parser.bucket_prefix).to eq("bucket-prefix")
  end

  it "should return name" do
    expect(@parser.name).to eq("lc")
  end
end
