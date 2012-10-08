require 'spec_helper'


describe AcupuncturePointsController do
  render_views
  before do
    login_user
  end

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
    it "assigns the requested acupuncture_point as @acupuncture_point" do
      acupuncture_point = AcupuncturePoint.create! valid_attributes
      get :show, {:id => acupuncture_point.to_param}, valid_session
      assigns(:acupuncture_point).should eq(acupuncture_point)
    end
  end

  describe "GET new" do
    it "assigns a new acupuncture_point as @acupuncture_point" do
      get :new, {}, valid_session
      assigns(:acupuncture_point).should be_a_new(AcupuncturePoint)
    end
  end

  describe "GET edit" do
    it "assigns the requested acupuncture_point as @acupuncture_point" do
      acupuncture_point = AcupuncturePoint.create! valid_attributes
      get :edit, {:id => acupuncture_point.to_param}, valid_session
      assigns(:acupuncture_point).should eq(acupuncture_point)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new AcupuncturePoint" do
        expect {
          post :create, {:acupuncture_point => valid_attributes}, valid_session
        }.to change(AcupuncturePoint, :count).by(1)
      end

      it "assigns a newly created acupuncture_point as @acupuncture_point" do
        post :create, {:acupuncture_point => valid_attributes}, valid_session
        assigns(:acupuncture_point).should be_a(AcupuncturePoint)
        assigns(:acupuncture_point).should be_persisted
      end

      it "redirects to the created acupuncture_point" do
        post :create, {:acupuncture_point => valid_attributes}, valid_session
        response.should redirect_to(AcupuncturePoint.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved acupuncture_point as @acupuncture_point" do
        # Trigger the behavior that occurs when invalid params are submitted
        AcupuncturePoint.any_instance.stub(:save).and_return(false)
        post :create, {:acupuncture_point => {}}, valid_session
        assigns(:acupuncture_point).should be_a_new(AcupuncturePoint)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        AcupuncturePoint.any_instance.stub(:save).and_return(false)
        post :create, {:acupuncture_point => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested acupuncture_point" do
        acupuncture_point = AcupuncturePoint.create! valid_attributes
        # Assuming there are no other acupuncture_points in the database, this
        # specifies that the AcupuncturePoint created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        AcupuncturePoint.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => acupuncture_point.to_param, :acupuncture_point => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested acupuncture_point as @acupuncture_point" do
        acupuncture_point = AcupuncturePoint.create! valid_attributes
        put :update, {:id => acupuncture_point.to_param, :acupuncture_point => valid_attributes}, valid_session
        assigns(:acupuncture_point).should eq(acupuncture_point)
      end

      it "redirects to the acupuncture_point" do
        acupuncture_point = AcupuncturePoint.create! valid_attributes
        put :update, {:id => acupuncture_point.to_param, :acupuncture_point => valid_attributes}, valid_session
        response.should redirect_to(acupuncture_point)
      end
    end

    describe "with invalid params" do
      it "assigns the acupuncture_point as @acupuncture_point" do
        acupuncture_point = AcupuncturePoint.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AcupuncturePoint.any_instance.stub(:save).and_return(false)
        put :update, {:id => acupuncture_point.to_param, :acupuncture_point => {}}, valid_session
        assigns(:acupuncture_point).should eq(acupuncture_point)
      end

      it "re-renders the 'edit' template" do
        acupuncture_point = AcupuncturePoint.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        AcupuncturePoint.any_instance.stub(:save).and_return(false)
        put :update, {:id => acupuncture_point.to_param, :acupuncture_point => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested acupuncture_point" do
      acupuncture_point = AcupuncturePoint.create! valid_attributes
      expect {
        delete :destroy, {:id => acupuncture_point.to_param}, valid_session
      }.to change(AcupuncturePoint, :count).by(-1)
    end

    it "redirects to the acupuncture_points list" do
      acupuncture_point = AcupuncturePoint.create! valid_attributes
      delete :destroy, {:id => acupuncture_point.to_param}, valid_session
      response.should redirect_to(acupuncture_points_url)
    end
  end

end
