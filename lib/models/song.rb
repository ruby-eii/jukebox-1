class Song


  def initialize(name, album, artist, opts={})
    @name   = name
    @album  = album
    @artist = artist
    @genre  = opts["genre"]
    @year   = opts["year"]
    @length = opts["length"]
    @price  = opts["price"]
  end

  attr_accessor :name, :album, :artist, :year, :genre, :length, :price

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
