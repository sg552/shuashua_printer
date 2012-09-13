require 'spec_helper'


describe DocumentsController do

  def valid_attributes
    {}
  end

  def valid_session
    {}
  end

  it "should GET index" do
    get :index
    response.should be_success
  end

  describe "GET show" do
    it "assigns the requested document as @document" do
      document = Document.create! valid_attributes
      get :show, {:id => document.to_param}, valid_session
      assigns(:document).should eq(document)
    end
  end

  it "should GET new" do
    get :new
    response.should be_success
  end

  describe "GET edit" do
    it "assigns the requested document as @document" do
      document = Document.create! valid_attributes
      get :edit, {:id => document.to_param}, valid_session
      assigns(:document).should eq(document)
    end
  end

  it "should create with point_sequence" do
    expect {
      post :create, :document => { :user_name => "some name"}, :point_sequence => "3, 5, 1"
    }.to change(Document, :count).by(1)
    document = Document.last
    document.arranged_acupuncture_points.size.should == 3
    response.should redirect_to document
  end
  it "should create with blank point_sequence" do
    expect {
      post :create, :document => { :user_name => "some name"}
    }.to change(Document, :count).by(1)
    document = Document.last
    document.arranged_acupuncture_points.should == []
    response.should redirect_to(document)
  end
  it "should PUT update with point_sequence(3 values), and create 3 arranged_acupuncture_points" do
    post :create, :document => { :user_name => "some name"}
    document = Document.first
    put :update, :id => document.id, :point_sequence => "2,4,6"
    document.arranged_acupuncture_points.size.should == 3
    response.should redirect_to(document)
  end
  it "should PUT update without point_sequence" do
    post :create, :document => { :user_name => "some name"}
    document = Document.first
    put :update, :id => document.id
    document.arranged_acupuncture_points.size.should == 0
    response.should redirect_to(document)
  end

  describe "DELETE destroy" do
    it "destroys the requested document" do
      document = Document.create! valid_attributes
      expect {
        delete :destroy, {:id => document.to_param}, valid_session
      }.to change(Document, :count).by(-1)
    end

    it "redirects to the documents list" do
      document = Document.create! valid_attributes
      delete :destroy, {:id => document.to_param}, valid_session
      response.should redirect_to(documents_url)
    end
  end

end
