require File.expand_path(File.join(File.dirname(__FILE__), 'test_helper'))

describe Marquetapage::Runner do
  describe '.run' do
    it 'without arg' do
      -> { Marquetapage::Runner.run }.must_raise ArgumentError
    end

    it 'with arg nil' do
      -> { Marquetapage::Runner.run(nil) }.must_raise ArgumentError
    end

    describe 'with a present tag' do
      before do
        @tag_name = 'firefox'
        @url = 'https://www.mozilla.org/en-US/firefox/central/'
        place_id = Place.insert url: @url
        bookmark_root_folder_id = 4
        tag_id = Bookmark.insert type: 2, fk: nil,
                                 parent: bookmark_root_folder_id,
                                 title: @tag_name,
                                 keyword_id: nil, folder_type: nil
        bookmark_id = Bookmark.insert type: 1, fk: place_id, parent: tag_id,
                                      position: 8, title: nil, keyword_id: nil,
                                      folder_type: nil
        anno_name = 'bookmarkProperties/description'
        anno_attribute_id = AnnotationAttribute.insert name: anno_name
        @content = 'description'
        ItemAnnotation.insert item_id: bookmark_id,
                              anno_attribute_id: anno_attribute_id,
                              content: @content
      end

      it 'with good arg' do
        out, err = capture_io do
          Marquetapage::Runner.run([@tag_name])
        end
        out.chomp.must_match @url
        out.chomp.must_match @content
        err.chomp.must_equal ''
      end
    end
  end
end
