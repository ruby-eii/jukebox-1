class Song

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

  attr_accessor :name, :album, :artist, :year, :genre, :length, :price

end
