class SongWithCustomAttrReader

  def initialize(name, album, artist, opts={})
    @name   = name
    @album  = album
    @artist = artist
    @genre  = opts["genre"]
    @year   = opts["year"]
    @length = opts["length"]
    @price  = opts["price"]
  end

  def method_missing(method, *args, &b)
    attr_match = method.to_s.match( /get_(.*)/ )
    if attr_match 
      instance_eval("@" + attr_match[1])
    else
      # Educational purposes, better call super
      raise NotImplementedError.new "What are you talking about? (#{method})"
    end
  end
end
