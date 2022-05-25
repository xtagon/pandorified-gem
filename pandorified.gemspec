# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'pandorified/version'

Gem::Specification.new do |spec|
  spec.name        = 'pandorified'
  spec.version     = Pandorified::VERSION
  spec.authors     = 'Justin Workman'
  spec.email       = 'xtagon@gmail.com'
  spec.summary     = 'A Ruby client for the Pandorabots API.'

  spec.description = <<~DOC.chomp
    Pandorified makes it easy for your Ruby scripts to interact with chat bots hosted on Pandorabots.
  DOC

  spec.files = `git ls-files`.split("\n")
  spec.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  spec.executables =
    `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }

  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'nokogiri', '>= 1.13.6'
  spec.add_runtime_dependency 'rest-client', '>= 1.7.3'

  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'yard'
end
