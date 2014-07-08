module RailsOdata::OdataService
  def self.included(base)
    base.send(:extend, ClassMethods)
  end

  def collections
    self.class.collections
  end

  module ClassMethods
    def collection(name, options = {})
      @collections << Collection.new(name, options)
    end

    def collections
      @collections
    end
  end

end
