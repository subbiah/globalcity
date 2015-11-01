class BillStatusesController < ApplicationController
  before_action :set_bill_status, only: [:show, :edit, :update, :destroy]

  respond_to :html,:json
  
  def view_bill

    @society_master_id = SocietyMaster.find_by_societyname(params[:society_master_id]).id

    @societyid = @society_master_id
    @fy = params[:fyear]
    @month = params[:month]
    
    puts "___________________________________"
    
    @total_count = BillStatus.where("society_master_id = ? AND fy = ? AND month = ?", @societyid, @fy, @month)
    @due_status_count = BillStatus.where("society_master_id = ? AND fy = ? AND month = ? AND status =?", @societyid, @fy, @month, "Due")
    @paid_status_count = BillStatus.where("society_master_id = ? AND fy = ? AND month = ? AND status =?", @societyid, @fy, @month, "Paid")
    @confirmed_status = BillStatus.where("society_master_id = ? AND fy = ? AND month = ? AND confirmed_status =?", @societyid, @fy, @month, "Confirmed")
    @due_amount = BillStatus.where("society_master_id = ? AND fy = ? AND month = ? AND status =?", @societyid, @fy, @month, "Due").to_a.sum(&:bill_amt)
    @confirmed_amount = BillStatus.where("society_master_id = ? AND fy = ? AND month = ? AND confirmed_status =?", @societyid, @fy, @month, "Confirmed").to_a.sum(&:bill_amt)
    
    @balanced_amount = @due_amount - @confirmed_amount
     
    society_bill_management_count = { 
      "total_count" => @total_count.count,
      "due_status_count" => @due_status_count.count,
      "paid_status_count" => @paid_status_count.count,
      "confirmed_status" => @confirmed_status.count,
      "due_amount" => @due_amount,
      "confirmed_amount" => @confirmed_amount,
      "balanced_amount" => @balanced_amount
    }
    
    society_bill_management_data = { 
      "total_data" => @total_count,
      "due_status_data" => @due_status_count,
      "paid_status_data" => @paid_status_count,
      "confirmed_status_data" => @confirmed_status      
    }
    
    
     society_bill = {
       "society_bill_management_count" => society_bill_management_count,
       "society_bill_management_data" => society_bill_management_data
     }
    
    respond_with society_bill
  end
  
  def my_bill
    @societyid = params[:society_master_id]
    @buildinno =  params[:building_no]
    @finacialyear = params[:fyear]
    @userid = params[:user_id]
    
    @bill_detail = BillStatus.where("society_master_id = ? AND fy = ? AND user_id = ? AND building_master_id = ?", @societyid, @finacialyear, @userid, @buildinno)

    @paid = BillStatus.where("society_master_id = ? AND fy = ? AND user_id = ? AND building_master_id = ? AND status = ?", @societyid, @finacialyear, @userid, @buildinno, "Paid")
        
    @due = BillStatus.where("society_master_id = ? AND fy = ? AND user_id = ? AND building_master_id = ? AND status = ?", @societyid, @finacialyear, @userid, @buildinno, "Due")

    @paid_amt = @paid.sum :bill_amt
    @due_amt = @due.sum :bill_amt
    @total_amt = @paid_amt +  @due_amt
    
      
    summary = { 
      "paid_amt" => @paid_amt,
      "due_amt" => @due_amt,
      "total_amt" => @total_amt,      
    }
    
    my_society_bill = {
      "bill_summary" => summary,
      "bill_detail" => @bill_detail
    }
           
     respond_with my_society_bill
    
  end
  
  def my_bill_confirmation
    @bill_id = ""    
    @payment_mode = ""
    @ref_no = ""
    
    @bill_update = BillStatus.find(@bill_id)
    @bill_update.payment_mode = @payment_mode
    @bill_update.reference_no = @ref_no
    @bill_update.save
    
  end
  

  def import
    # decoded_file = Base64.decode64(params[:file])
    # puts StringIO.open(decoded_file)

    @user_id = params[:user_id]
    @society_master_id = SocietyMaster.find_by_societyname(params[:society_master_id]).id
    @month = params[:month]
    @finacial_year = params[:fyear]
    BillStatus.import(params[:file], @user_id, @society_master_id, @month, @finacial_year)
    # redirect_to root_url, notice: "Products imported." 
    response = Hash.new
    response["success"] = true
    respond_with response, :location => verify_account_path
    
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
      params.require(:bill_status).permit(:society_master_id, :building_master_id, :user_id, :bill_amt, :fy, :month, :status, :upload_status, :deletion_flag, :flat_id, :confirmed_status,:payment_mode,:ref_no)
    end
end
