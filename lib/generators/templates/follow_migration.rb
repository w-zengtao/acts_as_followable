class ActsAsFollowableMigration < ActiveRecord::Migration[5.0]
  def self.up
    create_table :follows, force: true do |t|
      t.references :followable, polymorphic: true, null: false
      t.references :follower, polymorphic: true, null: false
      t.boolean :blocked, default: false, null: false
      t.timestamps
    end
  end

  def self.down
    drop_table :follows
  end
end
