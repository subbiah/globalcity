class TownshipMastersController < ApplicationController
  before_action :set_township_master, only: [:show, :edit, :update, :destroy]

  # GET /township_masters
  # GET /township_masters.json
  def index
    @township_masters = TownshipMaster.all
  end

  # GET /township_masters/1
  # GET /township_masters/1.json
  def show
  end

  # GET /township_masters/new
  def new
    @township_master = TownshipMaster.new
  end

  # GET /township_masters/1/edit
  def edit
  end

  # POST /township_masters
  # POST /township_masters.json
  def create
    @township_master = TownshipMaster.new(township_master_params)

    respond_to do |format|
      if @township_master.save
        format.html { redirect_to @township_master, notice: 'Township master was successfully created.' }
        format.json { render :show, status: :created, location: @township_master }
      else
        format.html { render :new }
        format.json { render json: @township_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /township_masters/1
  # PATCH/PUT /township_masters/1.json
  def update
    respond_to do |format|
      if @township_master.update(township_master_params)
        format.html { redirect_to @township_master, notice: 'Township master was successfully updated.' }
        format.json { render :show, status: :ok, location: @township_master }
      else
        format.html { render :edit }
        format.json { render json: @township_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /township_masters/1
  # DELETE /township_masters/1.json
  def destroy
    @township_master.destroy
    respond_to do |format|
      format.html { redirect_to township_masters_url, notice: 'Township master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_township_master
      @township_master = TownshipMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def township_master_params
      params.require(:township_master).permit(:townshipname, :activeflag, :address1, :address2, :locationcode, :citycode, :districtcode, :satecode, :countrycode, :pincode)
    end
end
