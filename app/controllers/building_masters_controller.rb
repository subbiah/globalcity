class BuildingMastersController < ApplicationController
  before_action :set_building_master, only: [:show, :edit, :update, :destroy]

  # GET /building_masters
  # GET /building_masters.json
  def index
    @building_masters = BuildingMaster.all
  end

  # GET /building_masters/1
  # GET /building_masters/1.json
  def show
  end

  # GET /building_masters/new
  def new
    @building_master = BuildingMaster.new
  end

  # GET /building_masters/1/edit
  def edit
  end

  # POST /building_masters
  # POST /building_masters.json
  def create
    @building_master = BuildingMaster.new(building_master_params)

    respond_to do |format|
      if @building_master.save
        format.html { redirect_to @building_master, notice: 'Building master was successfully created.' }
        format.json { render :show, status: :created, location: @building_master }
      else
        format.html { render :new }
        format.json { render json: @building_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /building_masters/1
  # PATCH/PUT /building_masters/1.json
  def update
    respond_to do |format|
      if @building_master.update(building_master_params)
        format.html { redirect_to @building_master, notice: 'Building master was successfully updated.' }
        format.json { render :show, status: :ok, location: @building_master }
      else
        format.html { render :edit }
        format.json { render json: @building_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /building_masters/1
  # DELETE /building_masters/1.json
  def destroy
    @building_master.destroy
    respond_to do |format|
      format.html { redirect_to building_masters_url, notice: 'Building master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building_master
      @building_master = BuildingMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def building_master_params
      params.require(:building_master).permit(:buildinname, :society_id, :flatno, :flattype, :activeflag)
    end
end
