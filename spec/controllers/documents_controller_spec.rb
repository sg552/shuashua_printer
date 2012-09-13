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
  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested document" do
        document = Document.create! valid_attributes
        # Assuming there are no other documents in the database, this
        # specifies that the Document created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Document.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => document.to_param, :document => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested document as @document" do
        document = Document.create! valid_attributes
        put :update, {:id => document.to_param, :document => valid_attributes}, valid_session
        assigns(:document).should eq(document)
      end

      it "redirects to the document" do
        document = Document.create! valid_attributes
        put :update, {:id => document.to_param, :document => valid_attributes}, valid_session
        response.should redirect_to(document)
      end
    end

    describe "with invalid params" do
      it "assigns the document as @document" do
        document = Document.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Document.any_instance.stub(:save).and_return(false)
        put :update, {:id => document.to_param, :document => {}}, valid_session
        assigns(:document).should eq(document)
      end

      it "re-renders the 'edit' template" do
        document = Document.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Document.any_instance.stub(:save).and_return(false)
        put :update, {:id => document.to_param, :document => {}}, valid_session
        response.should render_template("edit")
      end
    end
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
