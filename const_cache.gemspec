# -*- encoding: utf-8 -*-

Gem::Specification.new do |spec|
  spec.name          = "const_cache"
  spec.version       = "0.0.1"
  spec.authors       = ["Thomas Kadauke"]
  spec.email         = ["tkadauke@imedo.de"]
  spec.description   = %q{Cache dynamic constant lookups in RubyMotion}
  spec.summary       = %q{Cache dynamic constant lookups in RubyMotion}
  spec.homepage      = "https://github.com/tkadauke/const_cache"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
end
