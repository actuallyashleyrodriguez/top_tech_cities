require_relative 'lib/top_tech_cities/version'

Gem::Specification.new do |spec|
  spec.name          = "top_tech_cities"
  spec.version       = TopTechCities::VERSION
  spec.authors       = ["Ashley Rodriguez"]
  spec.email         = ["arodriguez1030@gmail.com"]

  spec.summary       = %q{This lists the top 10 cities}
  spec.description   = %q{The top 10 cities with salaries and companies for software engineers.}
  spec.homepage      = "https://github.com/arodriguez1030/top_tech_cities"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://www.bloohblah.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/arodriguez1030/top_tech_cities"
  spec.metadata["changelog_uri"] = "http://www.bloohblah.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
