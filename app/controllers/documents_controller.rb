class DocumentsController < ApplicationController
  before_filter :get_by_id, :only => [:show, :edit, :update, :destroy]
  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @documents }
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  # GET /documents/new.json
  def new
    @document = Document.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @document }
    end
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(params[:document])
    unless params[:point_sequence].blank?
      params[:point_sequence].split(",").each do |point_id|
        @document.arranged_acupuncture_points << ArrangedAcupuncturePoint.new(:acupuncture_point_id => point_id)
      end
    end

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, :notice => 'Document was successfully created.' }
        format.json { render :json => @document, :status => :created, :location => @document }
      else
        format.html { render :action => "new" }
        format.json { render :json => @document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /documents/1
  # PUT /documents/1.json
  def update

    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to @document, :notice => 'Document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_url }
      format.json { head :no_content }
    end
  end
  private
  def get_by_id
    @document = Document.find(params[:id])
  end
end
