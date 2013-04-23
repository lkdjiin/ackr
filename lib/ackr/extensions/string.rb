# -*- encoding: utf-8 -*-

class String

  # Public: Transform itself in a Regexp.
  #
  # Returns a Regexp if successful, nil otherwise.
  # ---
  # Credit to Josh Cheek: http://www.ruby-forum.com/topic/193809
  #
  # Note: there is also a gem:
  #   https://github.com/seamusabshere/to_regexp 
  #   Could be useful if I later want to parse things like
  #     $ ackr %r{regexp}
  #   or if bugs are discovered in the following code.
  def to_regexp
    return nil unless self.strip.match(/\A\/(.*)\/(.*)\Z/mx)
    regexp , flags = $1 , $2
    return nil if !regexp || flags =~ /[^xim]/m

    x = /x/.match(flags) && Regexp::EXTENDED
    i = /i/.match(flags) && Regexp::IGNORECASE
    m = /m/.match(flags) && Regexp::MULTILINE

    Regexp.new regexp , [x,i,m].inject(0){|a,f| f ? a+f : a }
  end
end
