# -*- encoding : utf-8 -*-
class MeridiansController < ApplicationController
  before_filter :get_by_id, :only => [:show, :edit, :update, :destroy]
  def index
    @meridians = Meridian.all
  end

  def show
  end

  def new
    @meridian = Meridian.new
  end

  def edit
  end

  def create
    @meridian = Meridian.new(params[:meridian])
    if @meridian.save
      redirect_to @meridian, :notice => 'Meridian was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    @meridian = Meridian.find(params[:id])

    if @meridian.update_attributes(params[:meridian])
      redirect_to @meridian, :notice => 'Meridian was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @meridian.destroy
    redirect_to meridians_path
  end
  private
  def get_by_id
    @meridian = Meridian.find(params[:id])
  end
end
