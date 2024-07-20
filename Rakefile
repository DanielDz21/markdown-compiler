task :default => :test
task :test do
  Dir.glob('./lib/**/*.rb').each       { |file| require file}
  Dir.glob('./spec/**/*_spec.rb').each { |file| require file}
end
