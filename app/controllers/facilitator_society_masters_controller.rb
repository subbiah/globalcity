class FacilitatorSocietyMastersController < ApplicationController
  before_action :set_facilitator_society_master, only: [:show, :edit, :update, :destroy]

  respond_to :html,:json
  def my_facilitator
    @societyid = params[:society_id]
    puts( @societyid)
    @my_facilitator = FacilitatorSocietyMaster.where("society_id = ? ", @societyid)
    respond_with @my_facilitator
  end

  def index
    @facilitator_society_masters = FacilitatorSocietyMaster.all
    respond_with(@facilitator_society_masters)
  end

  def show
    respond_with(@facilitator_society_master)
  end

  def new
    @facilitator_society_master = FacilitatorSocietyMaster.new
    respond_with(@facilitator_society_master)
  end

  def edit
  end

  def create
    @facilitator_society_master = FacilitatorSocietyMaster.new(facilitator_society_master_params)
    @facilitator_society_master.save
    respond_with(@facilitator_society_master)
  end

  def update
    @facilitator_society_master.update(facilitator_society_master_params)
    respond_with(@facilitator_society_master)
  end

  def destroy
    @facilitator_society_master.destroy
    respond_with(@facilitator_society_master)
  end

  private

  def set_facilitator_society_master
    @facilitator_society_master = FacilitatorSocietyMaster.find(params[:id])
  end

  def facilitator_society_master_params
    params.require(:facilitator_society_master).permit(:society_id, :category, :facilitatorname, :mobilenumber, :mobilenumber2, :emailid, :location, :city, :state, :country, :pincode, :activeflag, :createdby)
  end
end
