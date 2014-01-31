b = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'co_scraper/version'

Gem::Specification.new do |spec|
  spec.name          = 'co_scraper'
  spec.version       = CoScraper::VERSION
  spec.authors       = ['John Molina']
  spec.email         = ['john@pixelhipsters.com']
  spec.description   = %q{Scrape data from clasificadosonline.com, organize into readable JSON and store in a database. }
  spec.summary       = %q{Scrape data from clasificadosonline.com, organize into readable JSON and store in a database. }
  spec.homepage      = 'https://github.com/Alaude/co_scraper'
  # spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 1.9.3'

  spec.add_dependency = 'open-uri'
  spec.add_dependency = 'nokogiri' 

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rspec', '~> 2.14.1'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'simplecov', '~> 0.8.2'
  spec.add_development_dependency 'simplecov-gem-adapter', '~> 1.0.1'
  spec.add_development_dependency 'coveralls', '~> 0.6.7'
  spec.add_development_dependency 'webmock', '~> 1.17.1'
  spec.add_development_dependency 'vcr', '~> 2.8.0'

end
