class CreateFeeds < ActiveRecord::Migration
  def self.up
    create_table :feeds do |t|
      t.string :title
      t.text :description
      t.string :pubdate
      t.timestamps
    end
  end

  def self.down
    drop_table :feeds
  end
end
