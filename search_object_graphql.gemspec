lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'English'
require 'search_object/plugin/graphql/version'

Gem::Specification.new do |spec|
  spec.name          = 'search_object_graphql'
  spec.version       = SearchObject::Plugin::Graphql::VERSION
  spec.authors       = ['Radoslav Stankov']
  spec.email         = ['rstankov@gmail.com']
  spec.description   = 'Search Object plugin to working with GraphQL'
  spec.summary       = 'Maps search objects to GraphQL resolvers'
  spec.homepage      = 'https://github.com/RStankov/SearchObjectGraphQL'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($RS)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'graphql', '~> 1.5'
  spec.add_dependency 'search_object', '~> 1.2'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'rubocop', '0.51.0'
  spec.add_development_dependency 'rubocop-rspec', '1.20.1'
end
