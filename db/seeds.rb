require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

load(Rails.root.join( 'db', 'seeds', "#{Rails.env.downcase}.rb"))