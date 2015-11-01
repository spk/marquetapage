require 'sequel'

# Marquetapage module handle env, db, and db connection
module Marquetapage
  # Get current environment from MARQUETAPAGE_ENV
  # Default: production
  # @return String
  def self.env
    ENV['MARQUETAPAGE_ENV'] || 'production'
  end

  # Get places.sqlite from current env
  # production will search first `.mozilla/firefox/xxx.default/places.sqlite`
  # other environment will search current directory for `places.ENV.sqlite`
  # @return String
  def self.db_path
    if env == 'production'
      mozilla_path = "#{ENV['HOME']}/.mozilla/firefox/*.default/places.sqlite"
      Dir.glob(mozilla_path).first
    else
      File.expand_path("../../places.#{env}.sqlite", __FILE__)
    end
  end

  # Use DATABASE_URL env var or return sqlite connection string
  # @return String
  def self.db
    ENV['DATABASE_URL'] || "sqlite://#{db_path}"
  end

  # Sequel connect
  # @return Sequel::SQLite::Database
  def self.sequel_connect
    @sequel_connect ||= Sequel.connect(db)
  end
end
