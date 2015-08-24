class AssociationMastersController < ApplicationController
  before_action :set_association_master, only: [:show, :edit, :update, :destroy]
respond_to :json, :html
  # GET /association_masters
  # GET /association_masters.json
  def index
    @association_masters = AssociationMaster.all
  end

  def all_association
     respond_with AssociationMaster.all.includes(:society_masters => :building_masters) 
  end
  # GET /association_masters/1
  # GET /association_masters/1.json
  def show
  end

  # GET /association_masters/new
  def new
    @association_master = AssociationMaster.new
  end

  # GET /association_masters/1/edit
  def edit
  end

  # POST /association_masters
  # POST /association_masters.json
  def create
    @association_master = AssociationMaster.new(association_master_params)

    respond_to do |format|
      if @association_master.save
        format.html { redirect_to @association_master, notice: 'Association master was successfully created.' }
        format.json { render :show, status: :created, location: @association_master }
      else
        format.html { render :new }
        format.json { render json: @association_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /association_masters/1
  # PATCH/PUT /association_masters/1.json
  def update
    respond_to do |format|
      if @association_master.update(association_master_params)
        format.html { redirect_to @association_master, notice: 'Association master was successfully updated.' }
        format.json { render :show, status: :ok, location: @association_master }
      else
        format.html { render :edit }
        format.json { render json: @association_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /association_masters/1
  # DELETE /association_masters/1.json
  def destroy
    @association_master.destroy
    respond_to do |format|
      format.html { redirect_to association_masters_url, notice: 'Association master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_association_master
      @association_master = AssociationMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def association_master_params
      params.require(:association_master).permit(:associationname, :township_id, :address1, :address2, :locationcode, :citycode, :districcode, :statecode, :countrycode, :pincode, :activeflag)
    end
end
