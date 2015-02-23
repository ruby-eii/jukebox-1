class SongWithCustomAttrReader

  def initialize(opts={})
    # TODO what's the best way for checking that some args should
    # be passed here? Should we use the method Hash#fetch or checking
    # the args by hand and launching an exception?
    @name   = opts[:name]
    @album  = opts[:album]
    @artist = opts[:artist]
    @genre  = opts[:genre]
    @year   = opts[:year]
    @length = opts[:length]
    @price  = opts[:price]
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
