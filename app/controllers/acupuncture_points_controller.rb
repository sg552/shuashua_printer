# -*- encoding : utf-8 -*-
class AcupuncturePointsController < ApplicationController
  before_filter :get_by_id, :only => [:show, :edit, :update, :destroy]
  def index
    @acupuncture_points = AcupuncturePoint.all
  end

  def show
  end

  def new
    @acupuncture_point = AcupuncturePoint.new
  end

  def edit
  end

  def create
    @acupuncture_point = AcupuncturePoint.new(params[:acupuncture_point])
    if @acupuncture_point.save
       redirect_to @acupuncture_point, :notice => 'Acupuncture point was successfully created.'
    else
       render :action => "new"
    end
  end

  def update
    if @acupuncture_point.update_attributes(params[:acupuncture_point])
       redirect_to @acupuncture_point, :notice => 'Acupuncture point was successfully updated.'
    else
       render :action => "edit"
    end
  end

  def destroy
    @acupuncture_point.destroy
    redirect_to acupuncture_points_url
  end
  private
  def get_by_id
    @acupuncture_point = AcupuncturePoint.find(params[:id])
  end
end
