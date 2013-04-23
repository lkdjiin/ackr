Ackr
================

Ackr is a very light grep/ack/rak replacement for lazy developers.

Description
-----------

Grep is a great tool. A very powerful tool. But most of the time, it is
too powerful for my needs. I can never remember its syntax nor its options.

Ack is great and powerful too. But here again it has so many options.

As a developer I have really simple needs. As a lazy developer I want the
most possible simple tool.

Here comes ackr:

  * Ackr look for a search string into all text files, into all subfolders, 
    from the working directory
  * Ackr is case insensitive
  * Ackr has no options
  * Ackr doesn't look into hidden folders/files
  * Search term is displayed in bold font

It runs on linux. It maybe runs on mac os. I guess it won't run on windows.

Install
-------------------------

    gem install ackr

Usage
--------------------------

    $ ackr fixme
    lib/ackr/search.rb
       8|   # FIXME Separate behaviours: search / print

    README.markdown
      21| $ackr fixme


More to come
--------------------------

Next versions may include

  * regexp
  * fuzzy search
  * configuration

All of that without a single option, of course.

Dependencies
--------------------------

  * ruby >= 1.9.2

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### There is many other ways to contibute to ackr

1. Reports any bug
2. Give me ideas
3. Correct my poor english syntax
4. Blog about ackr
5. Tell ackr to your friends or colleague

License
--------------------------

MIT


Questions and/or Comments
--------------------------

Feel free to email [Xavier Nayrac](mailto:xavier.nayrac@gmail.com)
with any questions.
