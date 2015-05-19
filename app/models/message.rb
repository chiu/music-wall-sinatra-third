require_relative 'user'

class Message < ActiveRecord::Base

belongs_to :user

  # validates :title, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 140 }
  validates :author, presence: true, length: { maximum: 25 }
  validates :song_title, presence: true, length: { maximum: 140 }

  def other_messages(current_author)
    message_record = []
    output_string = ""
    message_record = Message.where(author: current_author)
    message_record.each do |element|
      output_string << " next message: \n" << element.content
    end
    return output_string
  end


  def show_user
    # self.user_id.name
    # User(id: self.user_id).name
    # self.users.all[0].name
    puts self.users.inspect
  end

   def upvote
     @new_vote = Vote.create
     @new_vote.message_id = id
     @new_vote.save

   end




end
