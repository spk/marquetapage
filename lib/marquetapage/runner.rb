# frozen_string_literal: true

require 'marquetapage'
require 'marquetapage/models'

module Marquetapage
  # Execute sql command to sqlite
  class Runner
    # Execute query and output as json the result
    # @example run(['firefox'])
    # @param [ARGV] args must include a tag
    # @return [Integer] Exit status
    def self.run(args)
      new.run(args)
    end

    # Execute query and output as json the result
    # @example run(['firefox'])
    # @param [ARGV] args must include a tag
    # @return [Integer] Exit status
    def run(args)
      raise ArgumentError unless args

      usage if args.empty?
      trap_interrupt
      @tag_name = args.first
      output_bookmarks
    end

    private

    # Print usage
    def usage
      puts 'Usage: marquetapage TAG'
      exit!(1)
    end

    # Trac Ctrl-c and exit cleanly
    def trap_interrupt
      trap('INT') do
        warn "\nExiting..."
        exit!(1)
      end
    end

    def output_bookmarks
      puts bookmarks.all.to_json
      @exit_status = 0
    rescue Sequel::Error => e
      warn e
      @exit_status = 1
    end

    def bookmarks
      Place
        .select(Sequel.qualify('moz_places', 'url'),
                Sequel.qualify('moz_bookmarks', 'title'),
                Sequel.qualify('moz_items_annos', 'content'))
        .from(:moz_places,
              :moz_bookmarks,
              :moz_items_annos,
              :moz_anno_attributes)
        .where(where_bookmarks_hash)
    end

    BOOKMARK_DESCRIPTION = 'bookmarkProperties/description'
    def where_bookmarks_hash
      {
        Sequel.qualify('moz_anno_attributes', 'name') => BOOKMARK_DESCRIPTION,
        Sequel.qualify('moz_items_annos', 'anno_attribute_id') =>
          Sequel.qualify('moz_anno_attributes', 'id'),
        Sequel.qualify('moz_items_annos', 'item_id') =>
          Sequel.qualify('moz_bookmarks', 'id'),
        Sequel.qualify('moz_bookmarks', 'fk') =>
          Sequel.qualify('moz_places', 'id'),
        Sequel.qualify('moz_places', 'id') => bookmark_place_ids
      }
    end

    def bookmark_place_ids
      Bookmark.distinct.select(:fk).where(parent: tag_id)
    end

    def tag_id
      Bookmark.where(Sequel.qualify('moz_bookmarks', 'title') =>
                     @tag_name).select(:id)
    end
  end
end
