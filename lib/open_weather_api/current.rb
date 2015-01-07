module OpenWeatherApi
  class Current
    def initialize(current)
      @current_hash = current.parsed_response
    end

    def [](key)
      @current_hash[key]
    end

    def method_missing(name, *args, &block)
      if @current_hash.respond_to? name
        @current_hash.send(name)
      elsif @current_hash.has_key?(name.to_s)
        @current_hash[name.to_s]
      else
        super
      end
    end
  end
end