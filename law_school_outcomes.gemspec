# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'law_school_outcomes/version'

Gem::Specification.new do |spec|
  spec.name          = "law_school_outcomes"
  spec.version       = LawSchoolOutcomes::VERSION
  spec.authors       = ["MJ Rossetti"]
  spec.email         = ["datacreativellc@gmail.com"]

  spec.summary       = %q{____________}
  spec.description   = %q{____________}
  spec.homepage      = "https://github.com/data-creative/law-school-outcomes-ruby"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "redcarpet"
  spec.add_development_dependency "github-markup"

  spec.add_dependency "httparty", "~> 0.13.3"
  #spec.add_dependency "pdf-reader", "~> 2.0"
  #spec.add_dependency "domainatrix", "~> 0.0.11"

end
