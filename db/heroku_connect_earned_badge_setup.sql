BEGIN;

  CREATE OR REPLACE FUNCTION sync_to_trailhead_earned_badges_proc() RETURNS trigger AS $$
    BEGIN
      RAISE NOTICE 'syncing to trailhead earned badges table earned badge ID %', NEW.id;
      UPDATE earned_badges
        SET
          badge_id = (SELECT trailhead_badge_id__c FROM salesforce.badge__c WHERE sfid = NEW.badge__c),
          user_id  = (SELECT trailhead_user_id__c FROM salesforce.contact WHERE sfid = NEW.contact__c)
        WHERE id = NEW.trailhead_earned_badge_id__c;
      RETURN NEW;
    END;
  $$ LANGUAGE plpgsql;

  DROP TRIGGER
    IF EXISTS sync_to_trailhead_earned_badges_trigger
    ON salesforce.badgeuser__c;
  
  CREATE TRIGGER sync_to_trailhead_earned_badges_trigger
    AFTER UPDATE OF
      badge__c,
      contact__c
    ON salesforce.badgeuser__c
    FOR EACH ROW
    WHEN (get_xmlbinary()::text != 'base64'::text)
    EXECUTE PROCEDURE sync_to_trailhead_earned_badges_proc();

END;
