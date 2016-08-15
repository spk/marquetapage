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
        STDERR.puts "\nExiting..."
        exit!(1)
      end
    end

    def output_bookmarks
      puts bookmarks.all.to_json
      @exit_status = 0
    rescue Sequel::Error => e
      puts e
      @exit_status = 1
    end

    def bookmarks
      Place
        .select(:moz_places__url,
                :moz_bookmarks__title,
                :moz_items_annos__content)
        .from(:moz_places,
              :moz_bookmarks,
              :moz_items_annos,
              :moz_anno_attributes)
        .where(where_bookmarks_hash)
    end

    def where_bookmarks_hash
      {
        moz_anno_attributes__name: 'bookmarkProperties/description',
        moz_items_annos__anno_attribute_id: :moz_anno_attributes__id,
        moz_items_annos__item_id: :moz_bookmarks__id,
        moz_bookmarks__fk: :moz_places__id,
        moz_places__id: bookmark_place_ids
      }
    end

    def bookmark_place_ids
      Bookmark.distinct.select(:fk).where(parent: tag_id)
    end

    def tag_id
      Bookmark.where(moz_bookmarks__title: @tag_name).select(:id)
    end
  end
end
