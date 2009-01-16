class ScalesController < ApplicationController
  # GET /scales
  # GET /scales.xml
  def index
    @scales = Scale.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scales }
    end
  end

  # GET /scales/1
  # GET /scales/1.xml
  def show
    @scale = Scale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @scale }
    end
  end

  # GET /scales/new
  # GET /scales/new.xml
  def new
    @scale = Scale.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scale }
    end
  end

  # GET /scales/1/edit
  def edit
    @scale = Scale.find(params[:id])
  end

  # POST /scales
  # POST /scales.xml
  def create
    @scale = Scale.new(params[:scale])

    respond_to do |format|
      if @scale.save
        flash[:notice] = 'Scale was successfully created.'
        format.html { redirect_to(@scale) }
        format.xml  { render :xml => @scale, :status => :created, :location => @scale }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @scale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scales/1
  # PUT /scales/1.xml
  def update
    @scale = Scale.find(params[:id])

    respond_to do |format|
      if @scale.update_attributes(params[:scale])
        flash[:notice] = 'Scale was successfully updated.'
        format.html { redirect_to(@scale) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @scale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /scales/1
  # DELETE /scales/1.xml
  def destroy
    @scale = Scale.find(params[:id])
    @scale.destroy

    respond_to do |format|
      format.html { redirect_to(scales_url) }
      format.xml  { head :ok }
    end
  end
end
