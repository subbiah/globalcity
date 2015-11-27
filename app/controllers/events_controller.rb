class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    # @events = Event.all
    @events = Array.new
    if params[:event_type]
      puts "Insede if :::::::::::::::::::: #{params[:event_type]}"
      @events = Event.all.where(:event_type => params[:event_type]).reverse
    end

    respond_with(@events)
  end

  def show
    respond_with(@event)
  end

  def new
    @eventtype = ["News","Ideas","Notice"]
    @event = Event.new
    respond_with(@event)
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    puts "Processing images ::::::::::::::::::::"
    puts params[:event][:EventImages]
    
    @event.save

    if params[:event][:EventImages]
      params[:event][:EventImages].each do |image|
        eventImage = Eventimage.new
        eventImage.event_id = @event.id
        eventImage.image_url = image[:image_url]
        eventImage.image_type = image[:image_type]
        eventImage.save
      end
    end

    respond_with(@event)
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :sdesc, :bdesc, :event_type, :user_id, :association_id, :society_id, :member_type, :association_name,:society_name, :EventImages)
    end
end
