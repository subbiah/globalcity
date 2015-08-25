class BillStatusesController < ApplicationController
  before_action :set_bill_status, only: [:show, :edit, :update, :destroy]

  respond_to :html,:json
  
  def view_bill
    @societyid = 5
    @fy = "2015-2016"
    @month = "january"
    
    puts "___________________________________"
    puts @sss = BillStatus.where("society_master_id = ? AND fy = ? AND month = ? AND status =?", @societyid, @fy, @month, "due").to_a.sum(&:bill_amt)
    
    @total_count = BillStatus.where("society_master_id = ? AND fy = ? AND month = ?", @societyid, @fy, @month).count
    @due_status_count = BillStatus.where("society_master_id = ? AND fy = ? AND month = ? AND status =?", @societyid, @fy, @month, "Due").count
    @paid_status_count = BillStatus.where("society_master_id = ? AND fy = ? AND month = ? AND status =?", @societyid, @fy, @month, "Paid").count
    @confirmed_status = BillStatus.where("society_master_id = ? AND fy = ? AND month = ? AND confirmed_status =?", @societyid, @fy, @month, "Confirmed").count
    @due_amount = BillStatus.where("society_master_id = ? AND fy = ? AND month = ? AND status =?", @societyid, @fy, @month, "Due").to_a.sum(&:bill_amt)
    @confirmed_amount = BillStatus.where("society_master_id = ? AND fy = ? AND month = ? AND confirmed_status =?", @societyid, @fy, @month, "Confirmed").to_a.sum(&:bill_amt)
    @balanced_amount = @due_amount - @confirmed_amount
     
    society_bill_management = { 
      "total_count" => @total_count,
      "due_status_count" => @due_status_count,
      "paid_status_count" => @paid_status_count,
      "confirmed_status" => @confirmed_status,
      "due_amount" => @due_amount,
      "confirmed_amount" => @confirmed_amount,
      "balanced_amount" => @balanced_amount
    }
    respond_with society_bill_management
  end
  

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
      params.require(:bill_status).permit(:society_master_id, :building_master_id, :user_id, :bill_amt, :fy, :month, :status, :upload_status, :deletion_flag, :flat_id, :confirmed_status)
    end
end
