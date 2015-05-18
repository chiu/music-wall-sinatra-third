class AddSongTitleRemoveContent < ActiveRecord::Migration
    def up
    add_column :messages, :song_title, :string
    # remove_column :messages, :content, :string

  end


  def down
    remove_column :messages, :song_title, :string
    # add_column :messages, :content, :string
  end
end
