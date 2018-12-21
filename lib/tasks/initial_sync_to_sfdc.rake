namespace 'db' do
  task :initial_sync_to_sfdc => :environment do
    User.all.each  { |u| u.add_user_to_sfdc  }
    Badge.all.each { |b| b.add_badge_to_sfdc }
  end
end
