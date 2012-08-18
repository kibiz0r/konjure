#!/usr/bin/env rake
$:.unshift('/Library/RubyMotion/lib')
require 'bundler/gem_tasks'
require 'motion/project'
require 'motion-objc-runtime'

Motion::Project::App.setup do |app|
  app.name = 'konjure'
  app.files.insert(0, *Dir['lib/konjure/**/*.rb'])
end
