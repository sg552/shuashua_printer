# -*- encoding : utf-8 -*-
require 'spec_helper'


describe MeridiansController do

  render_views
  def valid_attributes
    {}
  end

  def valid_session
    {}
  end

  it "should get index " do
    get :index
    response.should be_success
  end

  describe "GET show" do
    it "assigns the requested meridian as @meridian" do
      meridian = Meridian.create! valid_attributes
      get :show, {:id => meridian.to_param}, valid_session
      assigns(:meridian).should eq(meridian)
    end
  end

  describe "GET new" do
    it "assigns a new meridian as @meridian" do
      get :new, {}, valid_session
      assigns(:meridian).should be_a_new(Meridian)
    end
  end

  describe "GET edit" do
    it "assigns the requested meridian as @meridian" do
      meridian = Meridian.create! valid_attributes
      get :edit, {:id => meridian.to_param}, valid_session
      assigns(:meridian).should eq(meridian)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Meridian" do
        expect {
          post :create, {:meridian => valid_attributes}, valid_session
        }.to change(Meridian, :count).by(1)
      end

      it "assigns a newly created meridian as @meridian" do
        post :create, {:meridian => valid_attributes}, valid_session
        assigns(:meridian).should be_a(Meridian)
        assigns(:meridian).should be_persisted
      end

      it "redirects to the created meridian" do
        post :create, {:meridian => valid_attributes}, valid_session
        response.should redirect_to(Meridian.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved meridian as @meridian" do
        # Trigger the behavior that occurs when invalid params are submitted
        Meridian.any_instance.stub(:save).and_return(false)
        post :create, {:meridian => {}}, valid_session
        assigns(:meridian).should be_a_new(Meridian)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Meridian.any_instance.stub(:save).and_return(false)
        post :create, {:meridian => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested meridian" do
        meridian = Meridian.create! valid_attributes
        # Assuming there are no other meridians in the database, this
        # specifies that the Meridian created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Meridian.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => meridian.to_param, :meridian => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested meridian as @meridian" do
        meridian = Meridian.create! valid_attributes
        put :update, {:id => meridian.to_param, :meridian => valid_attributes}, valid_session
        assigns(:meridian).should eq(meridian)
      end

      it "redirects to the meridian" do
        meridian = Meridian.create! valid_attributes
        put :update, {:id => meridian.to_param, :meridian => valid_attributes}, valid_session
        response.should redirect_to(meridian)
      end
    end

    describe "with invalid params" do
      it "assigns the meridian as @meridian" do
        meridian = Meridian.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Meridian.any_instance.stub(:save).and_return(false)
        put :update, {:id => meridian.to_param, :meridian => {}}, valid_session
        assigns(:meridian).should eq(meridian)
      end

      it "re-renders the 'edit' template" do
        meridian = Meridian.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Meridian.any_instance.stub(:save).and_return(false)
        put :update, {:id => meridian.to_param, :meridian => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested meridian" do
      meridian = Meridian.create! valid_attributes
      expect {
        delete :destroy, {:id => meridian.to_param}, valid_session
      }.to change(Meridian, :count).by(-1)
    end

    it "redirects to the meridians list" do
      meridian = Meridian.create! valid_attributes
      delete :destroy, {:id => meridian.to_param}, valid_session
      response.should redirect_to(meridians_url)
    end
  end

end
