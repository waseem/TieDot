class LsParliamentsController < ApplicationController
  # GET /ls_parliaments
  # GET /ls_parliaments.json
  def index
    @ls_parliaments = LsParliament.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ls_parliaments }
    end
  end

  # GET /ls_parliaments/1
  # GET /ls_parliaments/1.json
  def show
    @ls_parliament = LsParliament.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ls_parliament }
    end
  end

  # GET /ls_parliaments/new
  # GET /ls_parliaments/new.json
  def new
    @ls_parliament = LsParliament.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ls_parliament }
    end
  end

  # GET /ls_parliaments/1/edit
  def edit
    @ls_parliament = LsParliament.find(params[:id])
  end

  # POST /ls_parliaments
  # POST /ls_parliaments.json
  def create
    @ls_parliament = LsParliament.new(params[:ls_parliament])
    @house = House.find_by_short_name("LS")
    @ls_parliament.house = @house

    respond_to do |format|
      if @ls_parliament.save
        format.html { redirect_to @ls_parliament, notice: 'Ls parliament was successfully created.' }
        format.json { render json: @ls_parliament, status: :created, location: @ls_parliament }
      else
        format.html { render action: "new" }
        format.json { render json: @ls_parliament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ls_parliaments/1
  # PUT /ls_parliaments/1.json
  def update
    @ls_parliament = LsParliament.find(params[:id])
    @house = House.find_by_short_name("LS")
    @ls_parliament.house = @house

    respond_to do |format|
      if @ls_parliament.update_attributes(params[:ls_parliament])
        format.html { redirect_to @ls_parliament, notice: 'Ls parliament was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ls_parliament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ls_parliaments/1
  # DELETE /ls_parliaments/1.json
  def destroy
    @ls_parliament = LsParliament.find(params[:id])
    @ls_parliament.destroy

    respond_to do |format|
      format.html { redirect_to ls_parliaments_url }
      format.json { head :no_content }
    end
  end
end
