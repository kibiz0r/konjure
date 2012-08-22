#!/usr/bin/env rake
$:.unshift('/Library/RubyMotion/lib')
require 'motion/project'
require 'motion-objc-runtime'

class Rake::Task
  def delete
    Rake.application.instance_variable_get('@tasks').delete self.name
  end
end

Motion::Project::App.setup do |app|
  app.name = 'konjure'
  app.files.insert(0, *Dir['lib/konjure/**/*.rb'])
end

task(:build).delete

require 'bundler/gem_tasks'
