class HerokuConnectSetup < ActiveRecord::Migration[5.1]
  def up
    if User.salesforce_schema_exists?
      execute File.read(File.expand_path('../../heroku_connect_setup.sql', __FILE__))
    end
  end

  def down
    throw ActiveRecord::IrreversibleMigration
  end
end
