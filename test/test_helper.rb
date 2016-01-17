# frozen_string_literal: true

ENV['MARQUETAPAGE_ENV'] = 'test'.freeze
require 'minitest/autorun'
require 'marquetapage'
require 'marquetapage/runner'

DB = Marquetapage.sequel_connect
%i(places anno_attributes items_annos bookmarks bookmarks_roots
   keywords favicons annos historyvisits inputhistory hosts).each do |t|
  DB.drop_table(:"moz_#{t}") if DB.table_exists?(:"moz_#{t}")
end
DB.run(File.read(File.expand_path('../moz_places.schema', __FILE__)))
