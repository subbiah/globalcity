class EventLikesController < ApplicationController
  before_action :set_event_like, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @event_likes = EventLike.all
    respond_with(@event_likes)
  end

  def show
    respond_with(@event_like)
  end

  def new
    @event_like = EventLike.new
    respond_with(@event_like)
  end

  def edit
  end

  def create
    @event_like = EventLike.new(event_like_params)
    puts ":::::::::::::::::::::::::::: user_id"
    puts event_like_params[:user_id]
    if EventLike.find_by_user_id(event_like_params[:user_id])
      respond_with({:errors => "user not found"}, :location => verify_account_path)
      return
    end
    @event_like.save
    respond_with(@event_like)
  end

  def update
    @event_like.update(event_like_params)
    respond_with(@event_like)
  end

  def destroy
    @event_like.destroy
    respond_with(@event_like)
  end

  private
    def set_event_like
      @event_like = EventLike.find(params[:id])
    end

    def event_like_params
      params.require(:event_like).permit(:event_id, :user_id)
    end
end
