# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tempura/version'

Gem::Specification.new do |gem|
  gem.name          = "tempura"
  gem.version       = Tempura::VERSION
  gem.authors       = ["Ben Cullen-Kerney"]
  gem.email         = ["ben@beancuke.com"]
  gem.description   = %q{Tempura is a library for temperature math and conversion. Currently supported scales are Fahrenheit, Celsius, Kelvin, Delisle, Newton, Rankine, Réaumer, and Rømer.}
  gem.summary       = %q{Tempura is a library for temperature math and conversion.}
  gem.homepage      = "https://github.com/bak/tempura"
  gem.files         = %W( 
                        .gitignore
                        Gemfile
                        LICENSE.txt
                        README.md
                        Rakefile
                        lib/tempura.rb
                        lib/tempura/celsius.rb
                        lib/tempura/delisle.rb
                        lib/tempura/fahrenheit.rb
                        lib/tempura/kelvin.rb
                        lib/tempura/newton.rb
                        lib/tempura/rankine.rb
                        lib/tempura/réaumur.rb
                        lib/tempura/rømer.rb
                        lib/tempura/temperature.rb
                        lib/tempura/version.rb
                        spec/spec_helper.rb
                        spec/tempura/celsius_spec.rb
                        spec/tempura/delisle_spec.rb
                        spec/tempura/fahrenheit_spec.rb
                        spec/tempura/kelvin_spec.rb
                        spec/tempura/newton_spec.rb
                        spec/tempura/rankine_spec.rb
                        spec/tempura/réaumur_spec.rb
                        spec/tempura/rømer_spec.rb
                        spec/tempura/temperature_spec.rb
                        tempura.gemspec
                      )

  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
end
