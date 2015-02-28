class Song

  def self.build_from_hash(opts={})
    id     = opts.fetch("id")
    name   = opts.fetch("name")
    album  = opts.fetch("album")
    artist = opts.fetch("artist")
    price  = opts.fetch("price")

    self.new(id, name, album, artist, price, opts)
  end

  def initialize(id, name, album, artist, price, opts={})
    @id     = id
    @name   = name
    @album  = album
    @artist = artist
    @price  = price

    @genre  = opts["genre"]
    @year   = opts["year"]
    @length = opts["length"]
  end

  attr_accessor :id, :name, :album, :artist, :year, :genre, :length, :price

  # It doesn't need to be so complex. This is just for showing once again how powerful is
  # the Ruby's metaprogramming support
  def as_hash
    {}.tap do |hash|
      self.instance_variables.each do |instance_variable|
        instance_variable_value     = self.instance_variable_get(instance_variable)
        formatted_instance_variable = instance_variable.to_s.sub('@', '')

        hash.store(formatted_instance_variable, instance_variable_value)
      end
    end
  end

end
