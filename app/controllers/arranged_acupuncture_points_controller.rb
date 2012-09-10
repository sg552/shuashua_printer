class ArrangedAcupuncturePointsController < ApplicationController
  # GET /arranged_acupuncture_points
  # GET /arranged_acupuncture_points.json
  def index
    @arranged_acupuncture_points = ArrangedAcupuncturePoint.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @arranged_acupuncture_points }
    end
  end

  # GET /arranged_acupuncture_points/1
  # GET /arranged_acupuncture_points/1.json
  def show
    @arranged_acupuncture_point = ArrangedAcupuncturePoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @arranged_acupuncture_point }
    end
  end

  # GET /arranged_acupuncture_points/new
  # GET /arranged_acupuncture_points/new.json
  def new
    @arranged_acupuncture_point = ArrangedAcupuncturePoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @arranged_acupuncture_point }
    end
  end

  # GET /arranged_acupuncture_points/1/edit
  def edit
    @arranged_acupuncture_point = ArrangedAcupuncturePoint.find(params[:id])
  end

  # POST /arranged_acupuncture_points
  # POST /arranged_acupuncture_points.json
  def create
    @arranged_acupuncture_point = ArrangedAcupuncturePoint.new(params[:arranged_acupuncture_point])

    respond_to do |format|
      if @arranged_acupuncture_point.save
        format.html { redirect_to @arranged_acupuncture_point, :notice => 'Arranged acupuncture point was successfully created.' }
        format.json { render :json => @arranged_acupuncture_point, :status => :created, :location => @arranged_acupuncture_point }
      else
        format.html { render :action => "new" }
        format.json { render :json => @arranged_acupuncture_point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /arranged_acupuncture_points/1
  # PUT /arranged_acupuncture_points/1.json
  def update
    @arranged_acupuncture_point = ArrangedAcupuncturePoint.find(params[:id])

    respond_to do |format|
      if @arranged_acupuncture_point.update_attributes(params[:arranged_acupuncture_point])
        format.html { redirect_to @arranged_acupuncture_point, :notice => 'Arranged acupuncture point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @arranged_acupuncture_point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /arranged_acupuncture_points/1
  # DELETE /arranged_acupuncture_points/1.json
  def destroy
    @arranged_acupuncture_point = ArrangedAcupuncturePoint.find(params[:id])
    @arranged_acupuncture_point.destroy

    respond_to do |format|
      format.html { redirect_to arranged_acupuncture_points_url }
      format.json { head :no_content }
    end
  end
end
