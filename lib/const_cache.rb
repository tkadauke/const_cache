unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

lib_dir_path = File.dirname(File.expand_path(__FILE__))
Motion::Project::App.setup do |app|
  app.info_plist['APP_ROOT'] = Dir.pwd
  app.files.unshift(Dir.glob(File.join(lib_dir_path, "motion/**/*.rb")))
end
