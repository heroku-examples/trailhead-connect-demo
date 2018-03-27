class Badge < ApplicationRecord
  belongs_to :unit
  has_many :users, through: :earned_badges

  after_create_commit   :add_badge_to_sfdc, if: :salesforce_schema_exists?
  after_update_commit   :update_badge_in_sfdc, if: :salesforce_schema_exists?
  after_destroy_commit  :remove_badge_from_sfdc, if: :salesforce_schema_exists?

  def add_badge_to_sfdc
    Badge.connection.execute <<~SQL
      INSERT
        INTO salesforce.badge__c (trailhead_badge_id__c, name, image_url__c)
        VALUES (#{id}, '#{name}', '#{image_url}');
    SQL
  end

  def update_badge_in_sfdc
    Badge.connection.execute <<~SQL
      UPDATE salesforce.badge__c
        SET
          name         = '#{name}',
          image_url__c = '#{image_url}'
        WHERE salesforce.badge__c.trailhead_badge_id__c = #{id};
    SQL
  end

  def remove_badge_from_sfdc
    Badge.connection.execute <<~SQL
      DELETE
        FROM salesforce.badge__c
        WHERE salesforce.badge__c.trailhead_badge_id__c = #{id};
    SQL
  end

  def salesforce_schema_exists?
    self.class.salesforce_schema_exists?
  end
end
