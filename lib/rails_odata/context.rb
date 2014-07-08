class RailsOdata::Context
  include Hashlike

  def intialize(parameters = {})

  end

  def merge(other)
    self.class.new(self.attributes.merge(other.attributes))
  end
end
