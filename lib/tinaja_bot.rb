# frozen_string_literal: true

require 'discordrb'
require 'httparty'

# Main bot class
class TinajaBot
  def initialize(token:, client_id:)
    @bot = Discordrb::Commands::CommandBot.new token:, client_id:, prefix: '!'
    setup_commands
  end

  def run
    at_exit { @bot.stop }
    @bot.run
  end

  private

  COMMANDS = {
    unexpo: ->(event) { "Hola <@#{event.user.id}>! *Tuetudiate en el poli?*" },
    exercism: lambda do |event, profile_name = nil|
      if profile_name
        response = HTTParty.get "https://exercism.org/profiles/#{profile_name}"
        message = case response.code
                  when 200..299
                    response.request.uri
                  when 400..499
                    "*#{profile_name}* does not appear to be a valid exercism public profile"
                  else
                    "Unexpected error: (HTTP #{response.code})"
                  end

        event.respond message
      else
        event.respond "<@#{event.user.id}> you must provide an exercism profile name."
      end

      nil
    end
  }.freeze

  def setup_commands
    COMMANDS.each do |command, setup_lambda|
      @bot.command command, &setup_lambda
    end
  end
end
