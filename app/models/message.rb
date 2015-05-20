require_relative 'user'

class Message < ActiveRecord::Base

  belongs_to :user
  has_many :votes

# validates :title, presence: true, length: { maximum: 40 }
validates :content, presence: true, length: { maximum: 140 }
validates :author, presence: true, length: { maximum: 25 }
validates :song_title, presence: true, length: { maximum: 140 }

def self.default_scope
  includes(:votes)
end

def other_messages(current_author)
  message_record = []
  output_string = ""
  message_record = Message.where(author: current_author)
  message_record.each do |element|
    output_string << " next message: \n" << element.content
  end
  return output_string
end


def show_original_poster
  unless user_id == nil
    @original_poster = User.find(self.user_id).name
# @original_poster = User.where(id: self.user_id)[0].name
puts "hi"
puts @original_poster
puts "hi"
return @original_poster
else
  return "no user found"
end
end

def upvote(user_argument)
  unless has_user_upvoted_before(user_argument)
    @new_vote = Vote.create
    @new_vote.message_id = id
    @new_vote.user_id = user_argument
    @new_vote.save
  end
end

def has_user_upvoted_before(user_argument)
# Vote.where(user_id: user_argument, message_id: id).any?
votes.where(user_id: user_argument).any?
end
end