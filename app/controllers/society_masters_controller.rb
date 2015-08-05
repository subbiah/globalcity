class SocietyMastersController < ApplicationController
  before_action :set_society_master, only: [:show, :edit, :update, :destroy]

  # GET /society_masters
  # GET /society_masters.json
  def index
    @society_masters = SocietyMaster.all
  end

  # GET /society_masters/1
  # GET /society_masters/1.json
  def show
  end

  # GET /society_masters/new
  def new
    @society_master = SocietyMaster.new
  end

  # GET /society_masters/1/edit
  def edit
  end

  # POST /society_masters
  # POST /society_masters.json
  def create
    @society_master = SocietyMaster.new(society_master_params)

    respond_to do |format|
      if @society_master.save
        format.html { redirect_to @society_master, notice: 'Society master was successfully created.' }
        format.json { render :show, status: :created, location: @society_master }
      else
        format.html { render :new }
        format.json { render json: @society_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /society_masters/1
  # PATCH/PUT /society_masters/1.json
  def update
    respond_to do |format|
      if @society_master.update(society_master_params)
        format.html { redirect_to @society_master, notice: 'Society master was successfully updated.' }
        format.json { render :show, status: :ok, location: @society_master }
      else
        format.html { render :edit }
        format.json { render json: @society_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /society_masters/1
  # DELETE /society_masters/1.json
  def destroy
    @society_master.destroy
    respond_to do |format|
      format.html { redirect_to society_masters_url, notice: 'Society master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_society_master
      @society_master = SocietyMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def society_master_params
      params.require(:society_master).permit(:societyname, :association_id, :address1, :address2, :locationcode, :citycode, :districcode, :statecode, :countrycode, :pincode, :activeflag)
    end
end
