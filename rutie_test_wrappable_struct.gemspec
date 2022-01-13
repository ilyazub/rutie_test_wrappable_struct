# frozen_string_literal: true

require_relative 'lib/rutie_test_wrappable_struct/version'

Gem::Specification.new do |spec|
  spec.name = 'rutie_test_wrappable_struct'
  spec.version = RutieTestWrappableStruct::VERSION
  spec.authors = ['Ilya Zub']
  spec.email = ['282605+ilyazub@users.noreply.github.com']

  spec.summary = 'Example of wrappable Rust struct with lifetime using Wasmer'
  spec.description = 'Example of wrappable Rust struct with lifetime using Wasmer.'
  spec.homepage = 'https://github.com/ilyazub/rutie_test_wrappable_struct'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = 'https://github.com/ilyazub/rutie_test_wrappable_struct/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.extensions = ['src']

  spec.add_dependency 'wasmer', '~> 1.0.0'

  spec.add_development_dependency 'bundler', '~> 2.2'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'standard', '~> 1.3'
  spec.add_development_dependency 'pry', '~> 0.14.1'
end
