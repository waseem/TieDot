class LsParliamentMembersController < ApplicationController
  # GET /ls_parliament_members
  # GET /ls_parliament_members.json
  def index
    @ls_parliament_members = LsParliamentMember.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ls_parliament_members }
    end
  end

  # GET /ls_parliament_members/1
  # GET /ls_parliament_members/1.json
  def show
    @ls_parliament_member = LsParliamentMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ls_parliament_member }
    end
  end

  # GET /ls_parliament_members/new
  # GET /ls_parliament_members/new.json
  def new
    @ls_parliament_member = LsParliamentMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ls_parliament_member }
    end
  end

  # GET /ls_parliament_members/1/edit
  def edit
    @ls_parliament_member = LsParliamentMember.find(params[:id])
  end

  # POST /ls_parliament_members
  # POST /ls_parliament_members.json
  def create
    @ls_parliament_member = LsParliamentMember.new(params[:ls_parliament_member])

    respond_to do |format|
      if @ls_parliament_member.save
        format.html { redirect_to @ls_parliament_member, notice: 'Ls parliament member was successfully created.' }
        format.json { render json: @ls_parliament_member, status: :created, location: @ls_parliament_member }
      else
        format.html { render action: "new" }
        format.json { render json: @ls_parliament_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ls_parliament_members/1
  # PUT /ls_parliament_members/1.json
  def update
    @ls_parliament_member = LsParliamentMember.find(params[:id])

    respond_to do |format|
      if @ls_parliament_member.update_attributes(params[:ls_parliament_member])
        format.html { redirect_to @ls_parliament_member, notice: 'Ls parliament member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ls_parliament_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ls_parliament_members/1
  # DELETE /ls_parliament_members/1.json
  def destroy
    @ls_parliament_member = LsParliamentMember.find(params[:id])
    @ls_parliament_member.destroy

    respond_to do |format|
      format.html { redirect_to ls_parliament_members_url }
      format.json { head :no_content }
    end
  end
end
