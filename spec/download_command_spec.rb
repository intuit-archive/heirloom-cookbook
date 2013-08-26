require File.expand_path("../", __FILE__) + '/spec_helper'

describe DownloadCommand do
  
  it "should recognize all arguments available to the CLI of Heirloom" do
    args = {
      :aws_access_key  => 'my-key',
      :aws_secret_key  => 'my-secret',
      :bucket_prefix   => 'my-bucket-prefix',
      :environment     => 'testing',
      :id              => 'v1.1.1',
      :level           => 'debug',
      :metadata_region => 'us-west-1',
      :name            => 'test',
      :output          => '/tmp/heirloom',
      :region          => 'us-east-1',
      :secret          => 'my-password',
      :secret_file     => 'my-secret-file',
      :use_iam_profile => true,
      :extract         => true
    }

    DownloadCommand.new.command(args)
      .should == "heirloom download --aws_access_key my-key --aws_secret_key my-secret -b my-bucket-prefix -e testing -i v1.1.1 -l debug -m us-west-1 -n test -o /tmp/heirloom -r us-east-1 -s my-password --secret_file my-secret-file --use_iam_profile -x"
  end

  it "should require the name and output arguments" do
    
    expect {
      DownloadCommand.new.command
    }.to raise_error ArgumentError

    expect {
      DownloadCommand.new.command({ :name => 'testname' })
    }.to raise_error ArgumentError

    expect {
      DownloadCommand.new.command({ :output => 'testoutput' })
    }.to raise_error ArgumentError

    DownloadCommand.new.command({ :name => 'testname', :output => 'testoutput' })
      .should == "heirloom download -n testname -o testoutput"

  end

end
