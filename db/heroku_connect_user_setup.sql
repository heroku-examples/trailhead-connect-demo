BEGIN;

  CREATE OR REPLACE FUNCTION sync_to_trailhead_users_proc() RETURNS trigger AS $$
    BEGIN
      RAISE NOTICE 'syncing to trailhead users table: %', NEW.name;
      UPDATE users
        SET
          name        = NEW.firstname || ' ' || NEW.lastname,
          description = NEW.description,
          image_url   = NEW.photourl
        WHERE id = NEW.trailhead_user_id__c;
      RETURN NEW;
    END;
  $$ LANGUAGE plpgsql;

  DROP TRIGGER
    IF EXISTS sync_to_trailhead_users_trigger
    ON salesforce.contact;

  CREATE TRIGGER sync_to_trailhead_users_trigger
    AFTER UPDATE OF
      name,
      description,
      photourl
    ON salesforce.contact
    FOR EACH ROW
    WHEN (get_xmlbinary()::text != 'base64'::text)
    EXECUTE PROCEDURE sync_to_trailhead_users_proc();
END;    
