class CreatedAts < ActiveRecord::Migration

  def up
    add_column :messages, :created_at, :datetime
    add_column :messages, :updated_at, :datetime

  end


  def down
    remove_column :messages, :created_at, :datetime
    remove_column :messages, :updated_at, :datetime

  end

end
