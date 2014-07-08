class RailsOdata::Collection
  attr_accessor :name, :options

  def intialize(name, options = {})
    @name = name
    @options = options
  end
end
