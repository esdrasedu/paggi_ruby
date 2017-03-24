module Paggi
  module TestMock
    def request(url, params = {}, method = :any)
      host = Paggi.configuration.host.gsub(%r{^https:\/\/}, '')
                 .gsub(%r{^http:\/\/}, '')
      version = Paggi.configuration.version
      headers = {
        content_type: 'application/json'
      }
      uri = Paggi.configuration.api_key + ":@#{host}api/#{version}/#{url}"
      stub_request(method, uri)
        .with(headers: headers)
        .with(body: params)
    end

    def post(request = {}, respond = nil, code = 200)
      respond = request.clone if respond.nil?
      request('customers', request, :post)
        .to_return(status: code, body: JSON.generate(respond), headers: {})
    end

    def put(id = 0, request = {}, respond = nil, code = 200)
      respond = request.clone if respond.nil?
      request("customers/#{id}", request, :put)
        .to_return(status: code, body: JSON.generate(respond), headers: {})
    end
  end
end
