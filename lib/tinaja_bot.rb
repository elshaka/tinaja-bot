# frozen_string_literal: true

require 'discordrb'
require 'httparty'

module TinajaBot
  class Bot
    def initialize(token:, client_id:)
      @bot = Discordrb::Commands::CommandBot.new token:, client_id:, prefix: '!'
      load_commands
    end

    def run
      at_exit { @bot.stop }
      @bot.run
    end

    private

    def load_commands
      Dir[Pathname(__dir__) + Pathname('tinaja-bot/commands/*.rb')].each do |file|
        require_relative file

        command = File.basename(file, '.rb').to_sym
        handler = TinajaBot::Commands.const_get(command.capitalize).handler
        @bot.command command, &handler
      end
    end
  end
end
