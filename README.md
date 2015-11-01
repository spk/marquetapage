# marquetapage

Extract from `places.sqlite` firefox bookmarks with specific tag to JSON format.

## Usage

~~~
marquetapage TAG
~~~

## Output format

~~~ json
[
  {
    "url": "",
    "title": "",
    "content": ""
  }
]
~~~

## Tests

~~~
bundle exec rake
~~~

## Resources

* https://github.com/websafe/ffbx
* https://wiki.mozilla.org/images/d/d5/Places.sqlite.schema3.pdf
* https://developer.mozilla.org/en-US/docs/Mozilla/Tech/Places/Database

## License

The MIT License

Copyright © 2015 Laurent Arnoud <laurent@spkdev.net>

---
[![Gem Version](https://badge.fury.io/rb/marquetapage.svg)](https://rubygems.org/gems/marquetapage)
[![Build Status](https://secure.travis-ci.org/spk/marquetapage.svg?branch=master)](https://travis-ci.org/spk/marquetapage)
[![Code Climate](http://img.shields.io/codeclimate/github/spk/marquetapage.svg)](https://codeclimate.com/github/spk/marquetapage)
[![Inline docs](http://inch-ci.org/github/spk/marquetapage.svg?branch=master)](http://inch-ci.org/github/spk/marquetapage)
[![License](https://img.shields.io/github/license/spk/marquetapage.svg)](http://opensource.org/licenses/MIT)
