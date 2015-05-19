class AddMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :user
      t.string :song_title
      t.string :author
      t.string :content
      t.string :url

      t.datetime :created_at
      t.datetime :updated_at


    end
  end
end


