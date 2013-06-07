
# it "should execute the heirloom command" do
heirloom_cookbook_archive "my-project" do
  id "v1.1.1"
  output "/tmp/heirloom"
end
