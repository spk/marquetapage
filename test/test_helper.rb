# frozen_string_literal: true

ENV['MARQUETAPAGE_ENV'] = 'test'
require 'minitest/autorun'
require 'marquetapage'

DB = Marquetapage.sequel_connect
%i[places anno_attributes items_annos bookmarks keywords favicons annos
   historyvisits inputhistory hosts].each do |t|
  DB.drop_table(:"moz_#{t}") if DB.table_exists?(:"moz_#{t}")
end
DB.run(File.read(File.expand_path('moz_places.schema', __dir__)))
