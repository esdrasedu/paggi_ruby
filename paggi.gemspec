$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

Gem::Specification.new do |s|
  s.name = 'paggi'
  s.version = '0.1.0'
  s.summary = 'Integrate Paggi with your Ruby app'
  s.description = 'Paggi\'s official gem that helps you to integrate with our services. See https://docs.paggi.com for details.'
  s.authors = ['Esdras Eduardo', 'Flávio Vieira']
  s.email = ['esdras.rosa@paggi.com', 'flavio.mv@gmail.com']
  s.homepage = 'http://docs.paggi.com'
  s.license = 'MIT'

  s.add_development_dependency('mocha', '~> 0.13')
  s.add_development_dependency('shoulda', '~> 3.5')
  s.add_development_dependency('test-unit', '~> 3.1')
  s.add_development_dependency('rake', '~> 10.4')
  s.add_development_dependency('webmock', '~> 1.21')
  s.add_dependency('httparty', '>= 0.13.7')

  s.files = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ['lib']
end
