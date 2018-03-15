class ActsAsUnlikableMigration < ActiveRecord::Migration[5.0]
  def self.up
    create_table :unlikes, force: true do |t|
      t.references :unlikable, polymorphic: true, null: false
      t.references :unliker, polymorphic: true, null: false
      t.timestamps
    end
  end

  def self.down
    drop_table :unlikes
  end
end
