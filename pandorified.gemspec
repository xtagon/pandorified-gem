$:.push File.expand_path('../lib', __FILE__)

require 'pandorified/version'

Gem::Specification.new do |spec|
  spec.name        = 'pandorified'
  spec.version     = Pandorified::VERSION
  spec.authors     = 'Justin Workman'
  spec.email       = 'xtagon@gmail.com'
  spec.summary     = 'A Ruby client for the Pandorabots API.'
  spec.description = 'Pandorified makes it easy for your Ruby scripts to interact with chat bots hosted on Pandorabots.'

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rest-client'
  spec.add_runtime_dependency 'nokogiri'

  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock'
end
