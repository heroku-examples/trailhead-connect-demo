# Dump the schema of the database into a SQL file instead of a .rb file.
#
# The database for this app contains triggers and other Postgres features that
# don't get saved in the default schema.rb.
Rails.application.config.active_record.schema_format = :sql
