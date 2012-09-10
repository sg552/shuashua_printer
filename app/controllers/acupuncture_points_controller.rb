class AcupuncturePointsController < ApplicationController
  # GET /acupuncture_points
  # GET /acupuncture_points.json
  def index
    @acupuncture_points = AcupuncturePoint.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @acupuncture_points }
    end
  end

  # GET /acupuncture_points/1
  # GET /acupuncture_points/1.json
  def show
    @acupuncture_point = AcupuncturePoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @acupuncture_point }
    end
  end

  # GET /acupuncture_points/new
  # GET /acupuncture_points/new.json
  def new
    @acupuncture_point = AcupuncturePoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @acupuncture_point }
    end
  end

  # GET /acupuncture_points/1/edit
  def edit
    @acupuncture_point = AcupuncturePoint.find(params[:id])
  end

  # POST /acupuncture_points
  # POST /acupuncture_points.json
  def create
    @acupuncture_point = AcupuncturePoint.new(params[:acupuncture_point])

    respond_to do |format|
      if @acupuncture_point.save
        format.html { redirect_to @acupuncture_point, :notice => 'Acupuncture point was successfully created.' }
        format.json { render :json => @acupuncture_point, :status => :created, :location => @acupuncture_point }
      else
        format.html { render :action => "new" }
        format.json { render :json => @acupuncture_point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /acupuncture_points/1
  # PUT /acupuncture_points/1.json
  def update
    @acupuncture_point = AcupuncturePoint.find(params[:id])

    respond_to do |format|
      if @acupuncture_point.update_attributes(params[:acupuncture_point])
        format.html { redirect_to @acupuncture_point, :notice => 'Acupuncture point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @acupuncture_point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /acupuncture_points/1
  # DELETE /acupuncture_points/1.json
  def destroy
    @acupuncture_point = AcupuncturePoint.find(params[:id])
    @acupuncture_point.destroy

    respond_to do |format|
      format.html { redirect_to acupuncture_points_url }
      format.json { head :no_content }
    end
  end
end
