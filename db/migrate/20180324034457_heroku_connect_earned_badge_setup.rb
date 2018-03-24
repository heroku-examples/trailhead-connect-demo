class HerokuConnectEarnedBadgeSetup < ActiveRecord::Migration[5.1]
  def up
    if EarnedBadge.salesforce_schema_exists?
      execute File.read(File.expand_path('../../heroku_connect_earned_badge_setup.sql', __FILE__))
    end
  end

  def down
    if EarnedBadge.salesforce_schema_exists?
      execute "DROP FUNCTION sync_to_trailhead_earned_badges_proc CASCADE;"
      execute "DROP TRIGGER IF EXISTS sync_to_trailhead_earned_badges_trigger ON salesforce.badgeuser__c;"
    end
  end
end
