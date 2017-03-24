PAGGI_ENV = ENV['PAGGI_ENV'] || ENV['RAILS_ENV'] || 'development'
PAGGI_CONFIG = YAML.load_file("#{Rails.root}/config/kiik.yml")[PAGGI_ENV]

Paggi.setup do |config|
  config.host = PAGGI_CONFIG['host']
  config.api_key = PAGGI_CONFIG['api_key']
  config.version = PAGGI_CONFIG['version']
end
