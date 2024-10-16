# frozen_string_literal: true

require 'rake'
require 'rubocop/rake_task'

RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-performance'
  task.requires << 'rubocop-rspec'
end

task :run do
  require 'dotenv'
  Dotenv.load
  require_relative 'lib/tinaja_bot'

  bot = TinajaBot.new token: ENV.fetch('TOKEN', nil), client_id: ENV.fetch('CLIENT_ID', nil)
  bot.run
end
