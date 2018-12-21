namespace 'db' do
  task :recreate_triggers => :environment do
    # user table
    if User.salesforce_schema_exists?
      execute File.read(File.expand_path('../../db/heroku_connect_user_setup.sql', __FILE__))
    end

    # badge table
    if Badge.salesforce_schema_exists?
      execute File.read(File.expand_path('../../db/heroku_connect_badge_setup.sql', __FILE__))
    end

    # earned_badge table
    if EarnedBadge.salesforce_schema_exists?
      execute File.read(File.expand_path('../../db/heroku_connect_earned_badge_setup.sql', __FILE__))
    end
  end
end
