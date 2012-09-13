require 'spec_helper'

describe Document do
  before do
    @document = create(:document)
    @acupuncture_point = create(:acupuncture_point)
    @arranged_acupuncture_point = create(:arranged_acupuncture_point,
      :acupuncture_point_id => @acupuncture_point.id,
      :document_id => @document.id)
  end

  it "should  have many arranged_acupuncture_points" do
    @document.arranged_acupuncture_points.should == [@arranged_acupuncture_point]
  end

  it "should have mnay acupuncture_points" do
    @document.acupuncture_points.should == [@acupuncture_point]
  end
end
