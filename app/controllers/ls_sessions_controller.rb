class LsSessionsController < ApplicationController
  # GET /ls_sessions
  # GET /ls_sessions.json
  def index
    @ls_sessions = LsSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ls_sessions }
    end
  end

  # GET /ls_sessions/1
  # GET /ls_sessions/1.json
  def show
    @ls_session = LsSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ls_session }
    end
  end

  # GET /ls_sessions/new
  # GET /ls_sessions/new.json
  def new
    @ls_session = LsSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ls_session }
    end
  end

  # GET /ls_sessions/1/edit
  def edit
    @ls_session = LsSession.find(params[:id])
  end

  # POST /ls_sessions
  # POST /ls_sessions.json
  def create
    @ls_session = LsSession.new(params[:ls_session])

    respond_to do |format|
      if @ls_session.save
        format.html { redirect_to @ls_session, notice: 'Ls session was successfully created.' }
        format.json { render json: @ls_session, status: :created, location: @ls_session }
      else
        format.html { render action: "new" }
        format.json { render json: @ls_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ls_sessions/1
  # PUT /ls_sessions/1.json
  def update
    @ls_session = LsSession.find(params[:id])

    respond_to do |format|
      if @ls_session.update_attributes(params[:ls_session])
        format.html { redirect_to @ls_session, notice: 'Ls session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ls_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ls_sessions/1
  # DELETE /ls_sessions/1.json
  def destroy
    @ls_session = LsSession.find(params[:id])
    @ls_session.destroy

    respond_to do |format|
      format.html { redirect_to ls_sessions_url }
      format.json { head :no_content }
    end
  end
end
