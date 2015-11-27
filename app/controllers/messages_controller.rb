class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  respond_to :json, :html

  def index

    if params[:type] == "sent"
      @messages = Message.where(:from_user_id => params[:user_id].to_i)
    else
      @messages = Message.where(:to_user_id => params[:user_id].to_i)
    end
    # @messages = Message.all
    respond_with(@messages)
  end

  def show
    respond_with(@message)
  end

  def new
    @message = Message.new
    respond_with(@message)
  end

  def edit
  end

  def create
    puts "names :::::::::::::::::::::::"
    puts params[:names].inspect

    from_user = User.find(message_params[:from_user_id])


    if params[:names] && params[:names].length > 0
      to_users = params[:names].split(',')
      puts to_users.inspect      
    end

    if to_users != []
      to_users.each do |name|
        user = User.find_by_username(name)

        @message = Message.new(message_params)
        @message.to_user_id = user.id
        @message.sender_name = from_user.username
        @message.receiver_name = name
        @message.save
      end
    end

    # @message = Message.new(message_params)
    # @message.save
    respond_with(@message)
  end

  def update
    @message.update(message_params)
    respond_with(@message)
  end

  def destroy
    @message.destroy
    respond_with(@message)
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:from_user_id, :to_user_id, :subject, :message, :read)
    end
end
