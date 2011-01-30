class CreateWpPosts < ActiveRecord::Migration
  def self.up
    create_table :wp_posts do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :wp_posts
  end
end
