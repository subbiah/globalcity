class GclifeRegistrationFlatdetailsController < ApplicationController
  before_action :set_gclife_registration_flatdetail, only: [:show, :edit, :update, :destroy]
  respond_to :html ,:json
  # GET /gclife_registration_flatdetails
  # GET /gclife_registration_flatdetails.json
  def index
    @gclife_registration_flatdetails = GclifeRegistrationFlatdetail.all
  end

  # GET /gclife_registration_flatdetails/1
  # GET /gclife_registration_flatdetails/1.json
  def show
  end

  # GET /gclife_registration_flatdetails/new
  def new
    @gclife_registration_flatdetail = GclifeRegistrationFlatdetail.new
  end

  # GET /gclife_registration_flatdetails/1/edit
  def edit
  end

  # POST /gclife_registration_flatdetails
  # POST /gclife_registration_flatdetails.json
  def create
    @gclife_registration_flatdetail = GclifeRegistrationFlatdetail.new(gclife_registration_flatdetail_params)

    puts "flat number :::::::::::::::::::::::::::::::"
    puts gclife_registration_flatdetail_params[:flat_number]
    if !Flat.where('flat LIKE ?',gclife_registration_flatdetail_params[:flat_number].to_s+'%').first
      puts "flat not found"
      respond_with({:errors => {:flat => "Flat number invalid."}}, :location => verify_account_path)
      return
    end

    @gclife_registration_flatdetail.status = "Inactive"
    user = User.find(@gclife_registration_flatdetail.user_id)
    # user.active = "Inactive"
    # user.save(:validate=> false)
    if @gclife_registration_flatdetail.save
      respond_with user.user_details, :location => verify_account_path
    else
      respond_with nil, :location => verify_account_path
    end



    # respond_to do |format|
    #   if @gclife_registration_flatdetail.save
    #     format.html { redirect_to user.user_details, notice: 'Gclife registration flatdetail was successfully created.' }
    #     format.json { render :show, status: :created, location: @gclife_registration_flatdetail }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @gclife_registration_flatdetail.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /gclife_registration_flatdetails/1
  # PATCH/PUT /gclife_registration_flatdetails/1.json
  def update
    respond_to do |format|
      if @gclife_registration_flatdetail.update(gclife_registration_flatdetail_params)
        format.html { redirect_to @gclife_registration_flatdetail, notice: 'Gclife registration flatdetail was successfully updated.' }
        format.json { render :show, status: :ok, location: @gclife_registration_flatdetail }
      else
        format.html { render :edit }
        format.json { render json: @gclife_registration_flatdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gclife_registration_flatdetails/1
  # DELETE /gclife_registration_flatdetails/1.json
  def destroy
    @gclife_registration_flatdetail.destroy
    respond_to do |format|
      format.html { redirect_to gclife_registration_flatdetails_url, notice: 'Gclife registration flatdetail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gclife_registration_flatdetail
      @gclife_registration_flatdetail = GclifeRegistrationFlatdetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gclife_registration_flatdetail_params
      params.require(:gclife_registration_flatdetail).permit(:user_id, :societyid, :buildingid, :ownertypeid, :avenue_name, :flat_number, :flat_type, :tenurestart, :tenureend, :member_type)
    end
end
