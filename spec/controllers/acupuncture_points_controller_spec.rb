# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AcupuncturePointsController do
  render_views
  before do
    login_user
    @acupuncture_point = FactoryGirl.create(:acupuncture_point)
  end

  it "should get index " do
    get :index
    response.should be_success
  end

  it "should GET show" do
    get :show, :id => @acupuncture_point.id
    assigns(:acupuncture_point).should eq(@acupuncture_point)
  end
  it "should GET new" do
    get :new
    response.should be_success
  end
  it "should GET edit" do
    get :edit, :id => @acupuncture_point.id
    response.should be_success
  end

  it "creates a new AcupuncturePoint" do
    expect {
      post :create, :acupuncture_point => {:name => 'lala'}
    }.to change(AcupuncturePoint, :count).by(1)
  end

  it "updates the requested acupuncture_point" do
    new_name = 'lala'
    put :update, :id => @acupuncture_point.to_param, :acupuncture_point => {'name' => new_name}
    @acupuncture_point.reload.name.should == new_name
  end

  describe "DELETE destroy" do
    it "destroys the requested acupuncture_point" do
      expect {
        delete :destroy, {:id => @acupuncture_point.id}
      }.to change(AcupuncturePoint, :count).by(-1)
    end
  end
end
