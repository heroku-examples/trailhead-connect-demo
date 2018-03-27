class EarnedBadge < ApplicationRecord
  belongs_to :badge
  belongs_to :user
  belongs_to :quiz_submission

  after_create_commit   :add_earned_badge_to_sfdc, if: :salesforce_schema_exists?
  after_update_commit   :update_earned_badge_in_sfdc, if: :salesforce_schema_exists?
  after_destroy_commit  :remove_earned_badge_from_sfdc, if: :salesforce_schema_exists?

  def add_earned_badge_to_sfdc
    EarnedBadge.connection.execute <<~SQL
      INSERT
        INTO salesforce.badgeuser__c (trailhead_earned_badge_id__c, contact__c, badge__c)
        VALUES (
          #{id},
          (SELECT sfid FROM salesforce.contact WHERE trailhead_user_id__c = #{user.id}),
          (SELECT sfid FROM salesforce.badge__c WHERE trailhead_badge_id__c = #{badge.id})
        );
    SQL
  end

  def update_earned_badge_in_sfdc
    EarnedBadge.connection.execute <<~SQL
      UPDATE salesforce.badgeuser__c
        SET
          salesforce.badgeuser__c.contact__c = (SELECT sfid FROM salesforce.contact WHERE trailhead_user_id__c = #{user.id}),
          salesforce.badgeuser__c.badge__c   = (SELECT sfid FROM salesforce.badge__c WHERE trailhead_badge_id__c = #{badge.id})
        WHERE salesforce.badgeuser__c.trailhead_earned_badge_id__c = #{id};
    SQL
  end

  def remove_earned_badge_from_sfdc
    EarnedBadge.connection.execute <<~SQL
      DELETE
        FROM salesforce.badgeuser__c
        WHERE salesforce.badgeuser__c.trailhead_earned_badge_id__c = #{id};
    SQL
  end

  def salesforce_schema_exists?
    self.class.salesforce_schema_exists?
  end
end
