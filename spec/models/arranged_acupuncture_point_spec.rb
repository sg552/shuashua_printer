require 'spec_helper'

describe ArrangedAcupuncturePoint do
  before do
    @document = create(:document)
    @acupuncture_point = create(:acupuncture_point)
    @arranged_acupuncture_point = create(:arranged_acupuncture_point,
      :acupuncture_point_id => @acupuncture_point.id,
      :document_id => @document.id)
  end
  it "should belong to AcupuncturePoint" do
    @arranged_acupuncture_point.document.should  == @document
    @arranged_acupuncture_point.acupuncture_point.should  == @acupuncture_point
  end
end
