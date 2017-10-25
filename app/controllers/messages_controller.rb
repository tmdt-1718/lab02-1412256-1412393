class MessagesController < ApplicationController
    before_action :authenticate, only: [:index, :show, :show2, :new, :create, :sentmessage]
    before_action :get_message, only: [:show, :show2]
    add_breadcrumb "MyMess", "/messages"

    def index
        add_breadcrumb "Inbox", messages_path
        @messages=Message.where(:receiver => session[:current_user_id])
        @messages = @messages.order('created_at ASC')
    end

    def sentmessage
        add_breadcrumb "Sent messages", "/messages/sentmessages"
        @messages=Message.where(:user_id => session[:current_user_id])
        @messages = @messages.order('created_at ASC')
    end

    def new
        add_breadcrumb "New message", new_message_path
        @cur_user = User.find_by(id: session[:current_user_id])
        @friends = Friendship.where(:user_id => session[:current_user_id], :block => false)
    end

    def show
        add_breadcrumb "Inbox", messages_path
        add_breadcrumb @message.title, show_path(@message.id)
        if (@message.seen==false && @message.user_id!=session[:current_user_id])
          @message.seen=true
          @message.seen_at=Time.now + 7.hours
          @message.save
        end
        # @message = Message.find(params[:id])
        #@message.update(view: @message.view+1)
        #@message.save
    end

    def show2
        add_breadcrumb "Sent messages", "/messages/sentmessages"
        add_breadcrumb @message.title, show2_path(@message.id)
        @check=@message.seen;
    end

    def create
      if (!params[:post][:title].strip.empty? && !params[:post][:body].strip.empty? && params[:post][:friend_id])
        @message = Message.new(title: params[:post][:title],  body: params[:post][:body], user_id: session[:current_user_id], receiver: params[:post][:friend_id], seen: false)
        if @message.save
          @message.created_at += 7.hours;
            if @message.save
               flash[:success] = "Send successfully."
               redirect_to sentmessage_path
             end
        end
      end
    end

    private
    def get_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:title, :body)
    end
end
