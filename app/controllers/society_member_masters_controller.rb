class SocietyMemberMastersController < ApplicationController
  before_action :set_society_member_master, only: [:show, :edit, :update, :destroy]

  # GET /society_member_masters
  # GET /society_member_masters.json
  def index
    @society_member_masters = SocietyMemberMaster.all
  end

  # GET /society_member_masters/1
  # GET /society_member_masters/1.json
  def show
  end

  # GET /society_member_masters/new
  def new
    @society_member_master = SocietyMemberMaster.new
  end

  # GET /society_member_masters/1/edit
  def edit
  end

  # POST /society_member_masters
  # POST /society_member_masters.json
  def create
    @society_member_master = SocietyMemberMaster.new(society_member_master_params)

    respond_to do |format|
      if @society_member_master.save
        format.html { redirect_to @society_member_master, notice: 'Society member master was successfully created.' }
        format.json { render :show, status: :created, location: @society_member_master }
      else
        format.html { render :new }
        format.json { render json: @society_member_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /society_member_masters/1
  # PATCH/PUT /society_member_masters/1.json
  def update
    respond_to do |format|
      if @society_member_master.update(society_member_master_params)
        format.html { redirect_to @society_member_master, notice: 'Society member master was successfully updated.' }
        format.json { render :show, status: :ok, location: @society_member_master }
      else
        format.html { render :edit }
        format.json { render json: @society_member_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /society_member_masters/1
  # DELETE /society_member_masters/1.json
  def destroy
    @society_member_master.destroy
    respond_to do |format|
      format.html { redirect_to society_member_masters_url, notice: 'Society member master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_society_member_master
      @society_member_master = SocietyMemberMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def society_member_master_params
      params.require(:society_member_master).permit(:society_id, :gclife_id, :fullname, :building_id, :mobileno, :ownertype, :membertyper, :activeflag)
    end
end
