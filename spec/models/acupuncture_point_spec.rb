# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AcupuncturePoint do
  before do
    @meridian = create(:meridian)
    @document = create(:document)
    @acupuncture_point = create(:acupuncture_point, :meridian_id => @meridian.id)
    @arranged_acupuncture_point = create(:arranged_acupuncture_point,
      :acupuncture_point_id => @acupuncture_point.id,
      :document_id => @document.id)
  end

  it "should have many arranged_acupuncture_points" do
    @acupuncture_point.arranged_acupuncture_points.should == [@arranged_acupuncture_point]
  end

  it "should have many documents " do
    @acupuncture_point.documents.should == [@document]
  end

  it "should belong to meridian" do
    @acupuncture_point.meridian.should == @meridian
  end
end
