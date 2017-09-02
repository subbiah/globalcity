class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  respond_to :json, :html
  require 'gcm'

  def index

    if params[:type] == "sent"
      @messages = Message.where(:from_user_id => params[:user_id].to_i, :from_user_delete_flag => false).offset(params[:offset]).limit(params[:limit]).reverse
    else
      @messages = Message.where(:to_user_id => params[:user_id].to_i, :to_user_delete_flag => false).offset(params[:offset]).limit(params[:limit]).reverse
    end
    # @messages = Message.all
    # @messages = @messages.reverse
    respond_with(@messages)
  end
  
  def msg_notification
    
    
  end
  
  def post_msg_notification
    puts "======================================"
    puts @tittle = params[:tittle]
    puts @token = params[:device_token]
    puts @msg = params[:msg]
    puts @category = params[:category]
    puts @event = params[:event]
    puts "-------------------------------------"  
    
    # @token = "AIzaSyBIdiIRJkVvCN9-e7ucEAsuO_I1gvxQCCIf-4kvNnWMd4:APA91bHkgwoQMVYq70CfPLA7gLP1gI0W1fm5tc_YP_d_cppAy9GafJqzOk0_PzPI4Qaw-dkkePySC-NRxF6K6xxUmFKwVlq29Muh0VzkH3-KAaOVlSfjv6Yrj2j052STI_gwL-3j9duY"
    # @token = "f-4kvNnWMd4:APA91bHkgwoQMVYq70CfPLA7gLP1gI0W1fm5tc_YP_d_cppAy9GafJqzOk0_PzPI4Qaw-dkkePySC-NRxF6K6xxUmFKwVlq29Muh0VzkH3-KAaOVlSfjv6Yrj2j052STI_gwL-3j9duY"
    puts @token
      # GCM.host = 'https://android.googleapis.com/gcm/send'
         # GCM.format = :json
         # GCM.key = "AIzaSyDsczG6Kf7O3k7re7MjzwPcxYN3s13FfvY"
         # contact_name = ""
         # # if user.profile && user.profile.username
           # # contact_name = user.profile.username
         # # else
           # # contact_name = user.username
         # # end
         # data = { :message => "msg notification"}
         # destination = [@token]
         # GCM.send_notification( destination, data )  

    # gcm = GCM.new("AIzaSyDsczG6Kf7O3k7re7MjzwPcxYN3s13FfvY")    
    # registration_ids= [@token] # an array of one or more client registration IDs
    # options = {data: {tittle: @tittle, message: @msg, category: @category, event: @event}, collapse_key: "updated_score"}
    # response = gcm.send(registration_ids, options)

    fcm = FCM.new("AAAA94VXrlo:APA91bFdGlEYuGg2MgD7QYFbuuWiPSoOC6KewSkE38n3bUnZCiGgqm4Z2Vp1U_zbL2KXF00Nao2YYCBnqeN4jJbD4REpxA5mIe5MrVnPoGK-mS0jeKrWyc_FmsN1S2G_0NNmXJYr9mKu")
    # you can set option parameters in here
    #  - all options are pass to HTTParty method arguments
    #  - ref: https://github.com/jnunemaker/httparty/blob/master/lib/httparty.rb#L29-L60
    #  fcm = FCM.new("my_api_key", timeout: 3)

    # registration_ids= ["12", "13"] # an array of one or more client registration tokens
    options = {data: {tittle: @tittle, message: @msg, category: @category, event: @event}, collapse_key: "updated_score"}
    registration_ids= [@token]
    response = fcm.send(registration_ids, options)
        
    puts response
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

    i = 0
    if to_users != []
      to_users.each do |name|
        user = User.find_by_email(name)

        # @message = Message.new(message_params)
        @message = Message.new
        if i == 0
          @message.from_user_id = message_params[:from_user_id]
          i = i + 1
        end 

        @message.subject = message_params[:subject]
        @message.message = message_params[:message]
        @message.sender_name = from_user.email
        @message.to_user_id = user.id
        @message.receiver_name = name
        @message.from_user_delete_flag = false
        @message.to_user_delete_flag = false

        #adding to users
        @message.to_users = params[:names]

        @message.save

        # sending notification
        # send_notification(tittle, message, id, category)
        user.send_notification("GCLife", "Mail from #{from_user.username}", "Inbox", "Inbox")

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
    # @message.destroy
    if params[:user_id]
      if params[:user_id].to_i == @message.to_user_id
        @message.to_user_delete_flag = true
      else
        @message.from_user_delete_flag = true
      end
      @message.save
    end
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
