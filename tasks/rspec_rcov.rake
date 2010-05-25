begin
  require 'spec/rake/verify_rcov'
  
  task :spec do
    Rake::Task['spec:verify_rcov'].invoke
  end
  
  namespace :spec do
  
    RCov::VerifyTask.new(:verify_rcov) do |t|
      t.threshold = 100.0
    end
  
  end

rescue LoadError
  desc 'spec rake task not available (rspec or rcov not installed)'
  task :spec do
    abort 'spec rake task is not available. Be sure to install rspec and rcov as a gem or plugin'
  end
end