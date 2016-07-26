class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    # @events = Event.all
    @events = Array.new

    puts "search text ::::::::::::::::::::::::"
    puts params[:search_text] 
    puts params[:user_id]

    user = User.find(params[:user_id])

    if params[:user_id] && params[:search_text]
      if params[:event_type]
        @events = user.events.where('title LIKE ? AND event_type = ?','%'+params[:search_text]+'%', params[:event_type]).reverse
      end
    else
      if params[:event_type]
        puts "Insede if :::::::::::::::::::: #{params[:event_type]}"
        @events = user.events.where(:event_type => params[:event_type]).reverse
      end
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

    Thread.new do
      puts "::::::::::::::::::::::::::::::::::::::::::"
      puts  "background work started"
      puts "::::::::::::::::::::::::::::::::::::::::::"

      user = User.find(@event.user_id)

      puts "::::::::::::::::::::::::::::::::::::::::::"
      puts  user.inspect
      puts "::::::::::::::::::::::::::::::::::::::::::"

      user.events << @event
      user.save(:validate => false)

      association_list = params[:event][:association_list].split(',')
      society_list = params[:event][:society_list].split(',')
      member_type_list = params[:event][:member_type_list].split(',')
      puts "::::::::::::::::::::::::::::: began all list"
      puts association_list.inspect
      puts society_list.inspect
      puts member_type_list.inspect
      puts "::::::::::::::::::::::::::::: end all list"

      User.all.each do |u|
        if user.id != u.id
          puts "::::::::::::::::::::::::::::: user check started"
          puts u.id
          u.gclife_registration_flatdetails.each do |flat|
            puts "::::::::::::::::::::::::::::: flat verification started"
            puts flat.avenue_name
            puts flat.societyid
            puts flat.member_type
            puts "::::::::::::::::::::::::::::::::::::::::"
            if (association_list.include? flat.avenue_name)
              if (society_list.include? flat.societyid)
                if (member_type_list.include? flat.member_type)
                  puts "::::::::::::::::::::::::::::: found user"
                  puts u.id
                  u.events << @event
                  u.save(:validate => false)
                  u.send_notification("GCLife", "#{user.username} posted #{@event.event_type}", @event.id, "#{@event.event_type}")
                  break
                end
              end 
            end
          end
          puts "::::::::::::::::::::::::::::: user check ended"
        end
      end

      puts "::::::::::::::::::::::::::::::::::::::::::"
      puts  "background work ended"
      puts "::::::::::::::::::::::::::::::::::::::::::"
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
      params.require(:event).permit(:title, :sdesc, :bdesc, :event_type, :user_id, :association_id, :society_id, :member_type, :association_name,:society_name, :EventImages, :association_list, :society_list, :member_type_list)
    end
end
