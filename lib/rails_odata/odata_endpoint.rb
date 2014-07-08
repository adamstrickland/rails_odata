module RailsOdata::OdataEndpoint
  def self.included(base)
    base.send(:extend, ClassMethods)
  end

  def show
    _render_for_action("service.xml.haml", :show, params)
  end

  def contextualize(params)
    Context.new(params)
  end

  def contextualize_for(action, params)
    Context.new(params)
  end

  module ClassMethods
    attr_reader :service_class, :namespace

    def endpoint_service(service_class)
      @service_class = service_class
    end

    def endpoint_namespace(ns)
      @namespace = ns
    end

    def validates_context(*fields, validation)
      @validations << Validation.new(fields, validation)
    end
  end

  private
  def _render_with_context(template, _context)
    _service = self.class.service.new(context: _context)
    HAML::Engine.new(File.join(File.dirname(__FILE__), "../../templates/#{template}")).render(service: _service)
  end

  def _render_for_action(template, action, params)
    _render_with_context(template, self.contextualize(params).merge(self.contextualize_for(action, params)))
  end

end
