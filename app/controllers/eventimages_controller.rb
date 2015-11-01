class EventimagesController < ApplicationController
  before_action :set_eventimage, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @eventimages = Eventimage.all
    respond_with(@eventimages)
  end

  def show
    respond_with(@eventimage)
  end

  def new
    eventid  = params[:id]
    console.log(eventid);
    @event  = Event.find(eventid)
    @eventimage = @event.Eventimages.build
    respond_with(@eventimage)
  end

  def edit
  end

  def create
    @eventimage = Eventimage.new(eventimage_params)
    @eventimage.save
    respond_with(@eventimage)
  end

  def update
    @eventimage.update(eventimage_params)
    respond_with(@eventimage)
  end

  def destroy
    @eventimage.destroy
    respond_with(@eventimage)
  end

  private
    def set_eventimage
      @eventimage = Eventimage.find(params[:id])
    end

    def eventimage_params
      params.require(:eventimage).permit(:image_url, :event_id, :image_type)
    end
end
