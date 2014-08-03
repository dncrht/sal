$:.push File.expand_path('../lib', __FILE__)
require 'sal/version'

Gem::Specification.new do |s|
  s.name        = 'sal-engine'
  s.version     = Sal::VERSION
  s.authors     = ['Daniel Cruz Horts']
  s.homepage    = 'https://github.com/dncrht/sal'
  s.summary     = 'A Rails engine with my recurrent additions'
  s.description = 'Sal (salt) is what you add to every meal. I add sal to my Rails projects'
  s.license     = 'MIT'

  s.files = Dir['{app,config,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '~> 4.1'

  s.add_development_dependency 'pry', '~> 0.10'
  s.add_development_dependency 'pry-rails', '~> 0.3'
  s.add_development_dependency 'pry-byebug', '~> 1.3'
  s.add_development_dependency 'rspec-rails', '~> 3.0'
  s.add_development_dependency 'capybara', '~> 2.4'
end
