class HerokuConnectBadgeSetup < ActiveRecord::Migration[5.1]
  def up
    if Badge.salesforce_schema_exists?
      execute File.read(File.expand_path('../../heroku_connect_badge_setup.sql', __FILE__))
    end
  end

  def down
    if Badge.salesforce_schema_exists?
      execute "DROP TRIGGER IF EXISTS sync_to_trailhead_badge_trigger ON salesforce.badge;"
      execute "DROP FUNCTION sync_to_trailhead_badge_proc;"
    end
  end
end
