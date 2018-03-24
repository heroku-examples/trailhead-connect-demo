BEGIN;

  CREATE OR REPLACE FUNCTION sync_to_trailhed_badges_proc() RETURNS trigger AS $$
    BEGIN
      RAISE NOTICE 'syncing to trailhead badges table badge ID %', NEW.id;
      UPDATE badges
        SET
          name      = NEW.name,
          image_url = NEW.image_url__c
        WHERE id = NEW.trailhead_badge_id__c;
      RETURN NEW;
    END;
  $$ LANGUAGE plpgsql;

  DROP TRIGGER
    IF EXISTS sync_to_trailhed_badges_trigger
    ON salesforce.badge;
  
  CREATE TRIGGER sync_to_trailhed_badges_trigger
    AFTER UPDATE OF
      name,
      image_url__c
    ON salesforce.badge__c
    FOR EACH ROW
    WHEN (get_xmlbinary()::text != 'base64'::text)
    EXECUTE PROCEDURE sync_to_trailhed_badges_proc();

END;
