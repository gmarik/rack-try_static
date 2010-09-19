require 'rake/rdoctask'
require 'rake/testtask'

desc "Run all the tests"
task :default => [:test]

desc "Generate RDox"
task "RDOX" do
  sh "specrb -Ilib:test -a --rdox >RDOX"
end

desc "Run specs with test/unit style output"
task :test do
  sh "specrb -Ilib:test -w #{ENV['TEST'] || '-a'} #{ENV['TESTOPTS']}"
end

desc "Run specs with specdoc style output"
task :spec do
  sh "specrb -Ilib:test -s -w #{ENV['TEST'] || '-a'} #{ENV['TESTOPTS']}"
end

desc "Run all the tests"
task :fulltest do
  sh "specrb -Ilib:test -w #{ENV['TEST'] || '-a'} #{ENV['TESTOPTS']}"
end

