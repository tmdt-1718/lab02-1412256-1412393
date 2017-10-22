class MessagesController < ApplicationController
    before_action :authenticate, only: [:index, :show, :new, :create, :update, :destroy]
    before_action :get_message, only: [:show]

    def index
        @messages=Message.all
        add_breadcrumb "Messages", messages_path
    end

    def new
        add_breadcrumb "Messages", messages_path
        add_breadcrumb "New", new_message_path
    end

    def show
        add_breadcrumb "Messages", messages_path
        add_breadcrumb @message.title, message_path(@message.id)
        #@message.view=1
        #@message.save
        # @message = Message.find(params[:id])
        #@message.update(view: @message.view+1)
        #@message.save
    end

    private
    def get_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:title, :body)
    end
end
