# -*- encoding : utf-8 -*-
class DocumentsController < ApplicationController
  before_filter :get_by_id, :only => [:show, :edit, :update, :destroy, :show_print_purpose]

  def index
    @documents = Document.all
  end

  def show
  end

  def new
    @document = Document.new
  end

  def edit
  end

  def create
    @document = Document.new(params[:document])
    save_arranged_acupuncture_points(@document, params)

    if @document.save
      redirect_to @document, :notice => '文档建立好了.'
    else
      render :action => "new"
    end
  end

  def update
    @document.arranged_acupuncture_points.clear
    save_arranged_acupuncture_points(@document, params)
    if @document.update_attributes(params[:document])
      redirect_to @document, :notice => '操作成功.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @document.destroy
    redirect_to documents_url
  end

  def show_print_purpose
    render :layout => false
  end
  private
  def get_by_id
    @document = Document.find(params[:id])
  end

  def save_arranged_acupuncture_points(document, params)
    ['zusanyin', 'shousanyin', 'zusanyang', 'shousanyang'].each do |meridian_category|
      parameter_name = "point_sequence_#{meridian_category}"
      unless params[parameter_name].blank?
        params[parameter_name].split(",").each_with_index do |point_id, index|
          document.arranged_acupuncture_points << ArrangedAcupuncturePoint.new(
            :acupuncture_point_id => point_id, :index => index)
        end
      end
    end
  end
end
