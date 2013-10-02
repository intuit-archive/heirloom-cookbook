require File.expand_path("../", __FILE__) + '/spec_helper'

describe HeirloomURLParser do
  it "should error when no arguments are passed" do
    expect {
      HeirloomURLParser.new
    }.to raise_error ArgumentError
  end
  
  before do
    @url = 's3://intu-lc-us-southeast-1/live_community/b1d9ca85a7311bd939ada326a711d7fc33c89204.tar.gz'
  end
  
  it "should return valid uri" do
    HeirloomURLParser.should_receive(:new).with(@url)
    HeirloomURLParser.new(@url)
  end

  it "should return id" do
    @heirloom_mock = double 'heirloom parser'
    HeirloomURLParser.should_receive(:new).with(@url).and_return @heirloom_mock
    @heirloom_mock.should_receive(:id).and_return("b1d9ca85a7311bd939ada326a711d7fc33c89204")
  end

  it "should return name" do
    pending
    HeirloomURLParser.should_receive(:new).with(@url).and_return(heirloom = double())
    heirloom.should_receive(:name).and_return("live_community")
    h = HeirloomURLParser.new(@url)
    h.name
  end

  it "should return bucket_prefix" do
    pending
    HeirloomURLParser.should_receive(:new).with(@url).and_return(heirloom = double())
    heirloom.should_receive(:bucket_prefix).and_return("intu-lc")
    h = HeirloomURLParser.new(@url)
    h.bucket_prefix
  end
end
