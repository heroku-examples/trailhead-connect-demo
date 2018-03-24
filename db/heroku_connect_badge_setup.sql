BEGIN;

  CREATE OR REPLACE FUNCTION sync_to_trailhed_earned_badges_proc() RETURNS trigger AS $$
    BEGIN
      RAISE NOTICE 'syncing to trailhead earned_badges table badge ID %', NEW.badge_id;
      UPDATE earned_badges
        SET
          badge_id  = NEW.tailhead_badge_id__c,
          user_id   = NEW.trailhead_user_id__c
        WHERE id = NEW.trailhead_earned_badge_id__c;
      RETURN NEW;
    END;
  $$ LANGUAGE plpgsql;

  DROP TRIGGER
    IF EXISTS sync_to_trailhed_earned_badges_trigger
    ON salesforce.earned_badge;
  
  CREATE TRIGGER sync_to_trailhed_earned_badges_trigger
    AFTER UPDATE OF
      badge_id,
      user_id
    ON salesforce.earned_badge
    FOR EACH ROW
    WHEN (get_xmlbinary()::text != 'base64'::text)
    EXECUTE PROCEDURE sync_to_trailhed_earned_badges_proc();

END;
