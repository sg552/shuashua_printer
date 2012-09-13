require 'spec_helper'

describe Meridian do

  before do
    @meridian = create(:meridian)
    @acupuncture_point = create(:acupuncture_point, :meridian_id => @meridian.id)
  end

  it "should have many acupuncture_points" do
    @meridian.acupuncture_points.should == [@acupuncture_point]
  end
end
