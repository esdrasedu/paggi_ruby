module Paggi
  class Resource
    include HTTParty

    attr_accessor :id, :created, :errors

    class << self

      def class_name
        self.name.split('::')[-1]
      end

      def url
        "#{Paggi.configuration.host}/api/#{Paggi.configuration.version}/#{Paggi::Util.underscore(class_name)}s"
      end

      def opts(headers={})
        {
          basic_auth: {username: Paggi.configuration.api_key, password: ''},
          headers: headers.merge({"Content-Type" => 'application/json'})
        }
      end

      def build(data, error = nil)
        if data['result'] && data['total']
          instance = Paggi::Paginated.new()
          instance.result = data['result'].map { |element| self.new(element) }
          instance.total = data['total']
        else
          instance = self.new(data)
        end
        instance.errors = error.errors unless error.nil?
        instance
      end

      def request(path=nil, params={}, method=:GET, header={})
        options = opts(header).merge(body: JSON.generate(params))
        url_abs = path.nil? ? url : "#{url}/#{path}"

        response = case method
                   when :GET
                     get(url_abs, options)
                   when :POST
                     post(url_abs, options)
                   when :PUT
                     put(url_abs, options)
                   else
                     raise StandardError.new("Method #{method} not implemented")
                   end

        case response.code
        when 200, 402
          build(JSON.parse(response.body))
        when 422, 404
          result = JSON.parse(response.body)
          PaggiError.new(result)
        else
          raise StandardError.new(response.message)
        end
      end

    end

    def initialize(attributes = {})
      attributes.each{ |name, value| self.instance_variable_set("@#{name}", value) }
      self.errors = []
    end

    def valid?
      self.errors.empty?
    end

    def to_json(attrs = [:id, :created])
      result = {}
      attrs.each{ |attr|
        value = self.instance_variable_get("@#{attr}")
        result[attr] = value unless value.nil? or value.empty?
      }
      result
    end
  end
end
