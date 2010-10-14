class AddLinkToFeeds < ActiveRecord::Migration
  def self.up
    add_column :feeds, :link, :string
  end

  def self.down
    remove_column :feeds, :link
  end
end
