require 'fileutils'

namespace :maintenance do
  desc 'Enter maintenance mode'
  task :start do
    FileUtils.touch(Rails.root.join('maintenance'))
  end

  desc 'Leave maintenance mode'
  task :stop do
    FileUtils.rm(Rails.root.join('maintenance'))
  end
end