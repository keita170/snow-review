class MessagesController < ApplicationController
  # showページだけに相互フォローの場合の条件を指定しているが、一旦コメントアウトにしてます。
  # before_action :follow_each_other, only: [:show]
  
  def show
    @user = User.find(params[:id])
    rooms = current_user.entries.pluck(:room_id)
    entries = Entry.find_by(user_id: @user.id, room_id: rooms)
    #部屋作成のために条件分岐
    unless entries.nil?
      @room = entries.room
    else
      @room = Room.new
      @room.save
      Entry.create(user_id: current_user.id, room_id: @room.id)
      Entry.create(user_id: @user.id, room_id: @room.id)
    end

    @messages = @room.messages
    @message = Message.new(room_id: @room.id)

  end
  
  def create
    @message = current_user.messages.new(message_params)
    @message.save
  end
  
  private
  #相互フォローだった場合に、DMできるように記述
  def follow_each_other
    user = User.find(params[:id])
    unless current_user.following?(user) && user.following?(current_user)
      redirect_to student_posts_path
    end
  end
  
  def message_params
    params.require(:message).permit(:message, :room_id)
  end

end
