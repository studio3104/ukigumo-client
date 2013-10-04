# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "ukigumo-client"
  spec.version       = "0.0.1"
  spec.authors       = ["studio3104"]
  spec.email         = ["studio3104.com@gmail.com"]
  spec.description   = %q{client for Ukigumo-Server (https://github.com/ukigumo/Ukigumo-Server)}
  spec.summary       = %q{client for Ukigumo-Server (https://github.com/ukigumo/Ukigumo-Server)}
  spec.homepage      = "https://github.com/studio3104/ukigumo-client"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
