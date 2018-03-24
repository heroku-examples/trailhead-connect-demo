class HerokuConnectBadgeSetup < ActiveRecord::Migration[5.1]
  def up
    if Badge.salesforce_schema_exists?
      execute File.read(File.expand_path('../../heroku_connect_badge_setup.sql', __FILE__))
    end
  end

  def down
    if Badge.salesforce_schema_exists?
      execute "DROP FUNCTION sync_to_trailhead_badges_proc CASCADE;"
      execute "DROP TRIGGER IF EXISTS sync_to_trailhead_badges_trigger ON salesforce.badge__c;"
    end
  end
end
