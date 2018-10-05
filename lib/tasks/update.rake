desc 'Update conditions'
task :update => :environment do
  Condition.update
end
