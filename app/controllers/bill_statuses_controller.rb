class BillStatusesController < ApplicationController
  before_action :set_bill_status, only: [:show, :edit, :update, :destroy]

  respond_to :html
  
  

def import
  BillStatus.import(params[:file])
  redirect_to root_url, notice: "Products imported."
end



  def import_excel
    
  end

  def index
    @bill_statuses = BillStatus.all
    respond_with(@bill_statuses)
  end

  def show
    respond_with(@bill_status)
  end

  def new
    @bill_status = BillStatus.new
    respond_with(@bill_status)
  end

  def edit
  end

  def create
    @bill_status = BillStatus.new(bill_status_params)
    @bill_status.save
    respond_with(@bill_status)
  end

  def update
    @bill_status.update(bill_status_params)
    respond_with(@bill_status)
  end

  def destroy
    @bill_status.destroy
    respond_with(@bill_status)
  end

  private
    def set_bill_status
      @bill_status = BillStatus.find(params[:id])
    end

    def bill_status_params
      params.require(:bill_status).permit(:society_master_id, :building_master_id, :user_id, :bill_amt, :fy, :month, :status, :upload_status, :deletion_flag)
    end
end
