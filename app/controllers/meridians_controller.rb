# -*- encoding : utf-8 -*-
class MeridiansController < ApplicationController
  # GET /meridians
  # GET /meridians.json
  def index
    @meridians = Meridian.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @meridians }
    end
  end

  # GET /meridians/1
  # GET /meridians/1.json
  def show
    @meridian = Meridian.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @meridian }
    end
  end

  # GET /meridians/new
  # GET /meridians/new.json
  def new
    @meridian = Meridian.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @meridian }
    end
  end

  # GET /meridians/1/edit
  def edit
    @meridian = Meridian.find(params[:id])
  end

  # POST /meridians
  # POST /meridians.json
  def create
    @meridian = Meridian.new(params[:meridian])

    respond_to do |format|
      if @meridian.save
        format.html { redirect_to @meridian, :notice => 'Meridian was successfully created.' }
        format.json { render :json => @meridian, :status => :created, :location => @meridian }
      else
        format.html { render :action => "new" }
        format.json { render :json => @meridian.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /meridians/1
  # PUT /meridians/1.json
  def update
    @meridian = Meridian.find(params[:id])

    respond_to do |format|
      if @meridian.update_attributes(params[:meridian])
        format.html { redirect_to @meridian, :notice => 'Meridian was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @meridian.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /meridians/1
  # DELETE /meridians/1.json
  def destroy
    @meridian = Meridian.find(params[:id])
    @meridian.destroy

    respond_to do |format|
      format.html { redirect_to meridians_url }
      format.json { head :no_content }
    end
  end
end
