class User < ApplicationRecord
  has_many :earned_badges
  has_many :badges, through: :earned_badges
  has_many :quiz_submissions

  after_create_commit   :add_user_to_sfdc, if: :salesforce_schema_exists?
  after_update_commit   :update_user_in_sfdc, if: :salesforce_schema_exists?
  after_destroy_commit  :remove_user_from_sfdc, if: :salesforce_schema_exists?

  def add_user_to_sfdc
    if name.include?(' ')
      firstname, lastname = name.split(' ', 2)
    else
      firstname = nil
      lastname = name
    end

    User.connection.execute <<~SQL
      INSERT
        INTO salesforce.contact (trailhead_user_id__c, firstname, lastname, description, image_url__c)
        VALUES (#{id}, '#{firstname}', '#{lastname}', '#{description}', '#{image_url}');
    SQL
  end

  def update_user_in_sfdc
    firstname, lastname = name.split(' ', 2)

    User.connection.execute <<~SQL
      UPDATE salesforce.contact
        SET
          salesforce.contact.firstname    = '#{firstname}'
          salesforce.contact.lastname     = '#{lastname}'
          salesforce.contact.description  = '#{description}'
          salesforce.contact.image_url__c = '#{image_url}'
        WHERE salesforce.contact.trailhead_user_id__c = #{id};
    SQL
  end

  def remove_user_from_sfdc
    User.connection.execute <<~SQL
      DELETE
        FROM salesforce.contact
        WHERE salesforce.contact.trailhead_user_id__c = #{id};
    SQL
  end

  def salesforce_schema_exists?
    self.class.salesforce_schema_exists?
  end
end
