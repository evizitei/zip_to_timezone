require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "ZipToState" do
  it "should show that 65203 is in Missouri" do
    ZipToState.get_mapping_for('65203').should == "MO"
  end
end
