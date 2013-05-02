# -*- encoding : utf-8 -*-
require 'spec_helper'
describe MeridiansController do
  render_views
  before do
    login_user
    @meridian = create(:meridian)
  end

  it "should get index " do
    get :index
    response.should be_success
  end

  describe "GET show" do
    it "assigns the requested meridian as @meridian" do
      get :show, {:id => @meridian.id}
      assigns(:meridian).should eq(@meridian)
    end
  end

  describe "GET new" do
    it "assigns a new meridian as @meridian" do
      get :new
      assigns(:meridian).should be_a_new(Meridian)
    end
  end

  describe "GET edit" do
    it "assigns the requested meridian as @meridian" do
      get :edit, :id => @meridian.id
      assigns(:meridian).should eq(@meridian)
    end
  end

  describe "POST create" do
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested meridian" do
        put :update, :id => @meridian.id, :meridian => {'name' => 'lala'}
        @meridian.reload.name.should == 'lala'
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested meridian" do
      expect {
        delete :destroy, {:id => @meridian.id}
      }.to change(Meridian, :count).by(-1)
    end
  end

end
