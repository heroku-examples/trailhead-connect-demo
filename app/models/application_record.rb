class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.salesforce_schema_exists?
    query = "select schema_name FROM information_schema.schemata WHERE schema_name = 'salesforce';"
    connection.execute(query).count == 1
  end
end
