# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'standard/rake'

namespace :extension do
  task :compile do
    sh 'cargo build'
  end

  task :test do
    sh 'cargo test'
  end

  task :clean do
    sh 'cargo clean'
  end

  task :lint do
    sh 'cargo clippy'
  end

  task build: :compile

  task default: ['extension:clean', 'extension:build', 'extension:test', 'extension:lint']
end

task default: [:clobber, 'extension:default', :spec, :standard]
