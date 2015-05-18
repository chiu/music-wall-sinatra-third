class AddUrls < ActiveRecord::Migration
  # def change
  #   change_table :messages do |t|

  #     t.string :url 
  #   end
  # end

  def up
    add_column :messages, :url, :string
  end


  def down
    remove_column :messages, :url, :string
  end


end
