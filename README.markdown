Ackr [![Build Status](https://travis-ci.org/lkdjiin/ackr.png)](https://travis-ci.org/lkdjiin/ackr) [![Gem Version](https://badge.fury.io/rb/ackr.png)](http://badge.fury.io/rb/ackr)
================

Ackr is the very minimum subset of grep/ack/rak I can think of for **lazy developers**.

Description
-----------

Grep is a great tool. A very powerful tool. But most of the time, it is
too powerful for my needs. I can never remember its syntax nor its options.

Ack is great and powerful too. But here again it has so many options.

As a developer I have really simple needs. As a lazy developer I want the
most possible simple tool.

Here comes ackr:

  * Ackr look for a search term into all text files, into all subfolders, 
    from the working directory
  * A search term is either **a string** (in this case Ackr is *case insensitive*)
    or **a regexp**
  * Ackr has **no options**
  * Ackr doesn't look into hidden folders/files
  * Search term is displayed in bold font

It runs on unixes. I guess it won't run on windows.

And one more thing: ackr **is not a replacement to grep/ack**. If you
need grep power, just use grep!

Install
-------------------------

    gem install ackr

Usage
--------------------------

To look for a string (case insensitive):

    $ ackr fixme
    lib/ackr/search.rb
       8|   # FIXME Separate behaviours: search / print

    README.markdown
      21| $ ackr fixme

Using a regexp (same search as above):

    $ ackr /fixme/i

If you want to search only in a specific directory, you can temporarily
`cd` into it like this:

    (cd your/path && ackr yoursearch)

### Tips

To look for a string containing spaces, quote the string:

    $ ackr 'string with spaces'

To look for a regex containing spaces, quote the regex:

    $ ackr '/regex with spaces/'

or escape the spaces:

    $ ackr /regex\ with\ spaces/

When your search string contains some characters special to Bash you
will have troubles. For example, instead of:

    $ ackr &:active

you must use:

    $ ackr '&:active'

### Ignored files and directories

Ackr doesn't look into hidden files or directories. In addition, ackr
ignores the following list of directories:
  
  * `blib`
  * `CVS`
  * `_darcs` 
  * `RCS`
  * `SCCS`
  * `pkg`
  * `tmp`
  * `temp`
  * `log`

If you really want to search into a such directory anyway, simply `cd`
into it and make the search.

### Caveats

Ackr is slow, very slow...
May be I will consider performance in a future version.

License
--------------------------

MIT


Questions and/or Comments
--------------------------

Feel free to email [Xavier Nayrac](mailto:xavier.nayrac@gmail.com)
with any questions, or contact me on [twitter](https://twitter.com/lkdjiin).
