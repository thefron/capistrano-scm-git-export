# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-scm-git-export'
  spec.version       = '0.1.2'
  spec.authors       = ['Hoseong Hwang']
  spec.email         = ['thefron@ultracaption.net']
  spec.description   = %q{Git export strategy for capistrano 3.x}
  spec.summary       = %q{Git export strategy for capistrano 3.x}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_dependency 'capistrano', '~> 3.0'
end
