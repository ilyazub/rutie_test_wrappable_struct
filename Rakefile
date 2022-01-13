# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'standard/rake'

namespace :extension do
  task :compile do
    sh 'rustc --target wasm32-unknown-unknown -O --crate-type=cdylib ./src/lib.rs -o ./target/lib.wasm'
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

  task default: ['extension:clean', 'extension:build']
end

task default: [:clobber, 'extension:default', :spec, :standard]
