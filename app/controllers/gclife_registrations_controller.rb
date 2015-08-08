class GclifeRegistrationsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_gclife_registration, only: [:show, :edit, :update, :destroy]
  
 

  # GET /gclife_registrations
  # GET /gclife_registrations.json
  def index
    @gclife_registrations = GclifeRegistration.all
  end

  # GET /gclife_registrations/1
  # GET /gclife_registrations/1.json
  def show
  end

  # GET /gclife_registrations/new
  def new
    @gclife_registration = GclifeRegistration.new
  end

  # GET /gclife_registrations/1/edit
  def edit
  end

  # POST /gclife_registrations
  # POST /gclife_registrations.json
  def create
    @gclife_registration = GclifeRegistration.new(gclife_registration_params)

    respond_to do |format|
      if @gclife_registration.save
         
        format.html { redirect_to @gclife_registration, notice: 'Gclife registration was successfully created.' }
        format.json { render :show, status: :created, location: @gclife_registration }
      else
        format.html { render :new }
        format.json { render json: @gclife_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gclife_registrations/1
  # PATCH/PUT /gclife_registrations/1.json
  def update
    respond_to do |format|
      if @gclife_registration.update(gclife_registration_params)
        format.html { redirect_to @gclife_registration, notice: 'Gclife registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @gclife_registration }
      else
        format.html { render :edit }
        format.json { render json: @gclife_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gclife_registrations/1
  # DELETE /gclife_registrations/1.json
  def destroy
    @gclife_registration.destroy
    respond_to do |format|
      format.html { redirect_to gclife_registrations_url, notice: 'Gclife registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gclife_registration
      @gclife_registration = GclifeRegistration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gclife_registration_params
      params.require(:gclife_registration).permit(:user_id, :mobileno, :fullname, :gender, :dob, :emergencycontact, :occupation, :address1, :address2, :locationcode, :statecode, :countrycode, :pincode, :activeflag)
    end
end
