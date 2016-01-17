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

Copyright © 2015-2016 Laurent Arnoud <laurent@spkdev.net>

---
[![Build](https://img.shields.io/travis-ci/spk/marquetapage.svg)](https://travis-ci.org/spk/marquetapage)
[![Version](https://img.shields.io/gem/v/marquetapage.svg)](https://rubygems.org/gems/marquetapage)
[![Documentation](https://img.shields.io/badge/doc-rubydoc-blue.svg)](http://www.rubydoc.info/gems/marquetapage)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](http://opensource.org/licenses/MIT "MIT")
[![Code Climate](http://img.shields.io/codeclimate/github/spk/marquetapage.svg)](https://codeclimate.com/github/spk/marquetapage)
[![Inline docs](http://inch-ci.org/github/spk/marquetapage.svg?branch=master)](http://inch-ci.org/github/spk/marquetapage)
