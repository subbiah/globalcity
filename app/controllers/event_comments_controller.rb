class EventCommentsController < ApplicationController
  before_action :set_event_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @event_comments = EventComment.all
    respond_with(@event_comments)
  end

  def show
    respond_with(@event_comment)
  end

  def new
    @event_comment = EventComment.new
    respond_with(@event_comment)
  end

  def edit
  end

  def create
    @event_comment = EventComment.new(event_comment_params)
    @event_comment.save

    @event = Event.find(@event_comment.event_id)
    user = User.find(@event.user_id)
  
    # sending notification
    # send_notification(tittle, message, id, category)
    if @event_comment.user_id != user.id
      user.send_notification("GCLife - #{@event.event_type}", "#{@event_comment.username} commented on your post", @event.id, "#{@event.event_type}")
    end
    respond_with(@event_comment)
  end

  def update
    @event_comment.update(event_comment_params)
    respond_with(@event_comment)
  end

  def destroy
    @event_comment.destroy
    respond_with(@event_comment)
  end

  private
    def set_event_comment
      @event_comment = EventComment.find(params[:id])
    end

    def event_comment_params
      params.require(:event_comment).permit(:event_id, :user_id, :username, :comment)
    end
end
