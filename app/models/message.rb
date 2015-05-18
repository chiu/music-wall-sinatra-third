class Message < ActiveRecord::Base



  # validates :title, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 140 }
  validates :author, presence: true, length: { maximum: 25 }


  def other_messages(current_author)
    message_record = []
    output_string = ""
    message_record = Message.where(author: current_author)

    # message_record[0]

    # return message_record[0]


    message_record.each do |element|
      output_string << " next message: \n" << element.content




    end

    return output_string

  end





end
