require 'rake'
require 'rake/testtask'
require 'rspec/core/rake_task'

task :default=>[:test]

desc "Run all spec tests"
RSpec::Core::RakeTask.new('test') do |t|
  t.pattern = ['test/spec/*_spec.rb']
  t.rspec_opts = "-fd -c"
end

desc "Run all spec tests and generate a coverage report"
task :coverage do
  ENV['COVERAGE'] = 'true'
  Rake::Task['test'].invoke
  `open coverage/index.html` if RUBY_PLATFORM.downcase.include?("darwin")
end
