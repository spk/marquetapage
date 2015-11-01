require 'marquetapage'

Marquetapage.sequel_connect

Sequel::Model.plugin :json_serializer

# moz_places Sequel class
class Place < Sequel::Model(:moz_places)
  # make aliasing work with json_serializer
  # @return String, NilClass
  def title
    self[:title]
  end

  # make aliasing work with json_serializer
  # @return String, NilClass
  def url
    self[:url]
  end

  # make aliasing work with json_serializer
  # @return String, NilClass
  def content
    self[:content]
  end
end

# moz_bookmarks_roots Sequel class
class BookmarkRoot < Sequel::Model(:moz_bookmarks_roots)
end

# moz_bookmarks Sequel class
class Bookmark < Sequel::Model(:moz_bookmarks)
end

# moz_items_annos Sequel class
class ItemAnnotation < Sequel::Model(:moz_items_annos)
end

# moz_anno_attributes Sequel class
class AnnotationAttribute < Sequel::Model(:moz_anno_attributes)
end