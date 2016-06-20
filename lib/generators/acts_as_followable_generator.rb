require 'rails/generators'
require 'rails/generators/migration'

class ActsAsFollowableGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end

  def self.next_migration_number(dirname)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def create_migration_file
    migration_template 'follow_migration.rb', 'db/migrate/acts_as_followable_migration.rb'
  end

  def create_model
    template "follow.rb", File.join('app/models', "follow.rb")
  end
end
