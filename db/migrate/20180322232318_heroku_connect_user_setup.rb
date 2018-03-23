class HerokuConnectUserSetup < ActiveRecord::Migration[5.1]
  def up
    if User.salesforce_schema_exists?
      execute File.read(File.expand_path('../../heroku_connect_user_setup.sql', __FILE__))
    end
  end

  def down
    if User.salesforce_schema_exists?
      execute "  DROP TRIGGER IF EXISTS sync_to_trailhead_users_trigger ON salesforce.contact;"
      execute "DROP FUNCTION sync_to_trailhead_users_proc;"
    end
  end
end
