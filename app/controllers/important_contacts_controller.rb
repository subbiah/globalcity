class ImportantContactsController < ApplicationController
  before_action :set_important_contact, only: [:show, :edit, :update, :destroy]

  respond_to :html,:json

  def index
    
    if params[:search_key] && params[:search_key].to_s.length > 0
     @important_contacts = ImportantContact.where('name LIKE ?','%'+params[:search_key].to_s+'%').offset(params[:offset]).limit(params[:limit])
   else
      @important_contacts = ImportantContact.all.offset(params[:offset]).limit(params[:limit])
   end
   
   
    respond_with(@important_contacts)
  end

  def show
    respond_with(@important_contact)
  end

  def new
    @important_contact = ImportantContact.new
    respond_with(@important_contact)
  end

  def edit
  end

  def create
    @important_contact = ImportantContact.new(important_contact_params)
    @important_contact.save
    respond_with(@important_contact)
  end

  def update
    @important_contact.update(important_contact_params)
    respond_with(@important_contact)
  end

  def destroy
    @important_contact.destroy
    respond_with(@important_contact)
  end

  private
    def set_important_contact
      @important_contact = ImportantContact.find(params[:id])
    end

    def important_contact_params
      params.require(:important_contact).permit(:name, :phno, :email, :category)
    end
end
