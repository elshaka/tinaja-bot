# frozen_string_literal: true

require 'discordrb'

class TinajaBot
  def initialize(token:)
    @bot = Discordrb::Bot.new(token:)
    setup
  end

  def setup
    @bot.message(with_text: 'UNEXPO') do |event|
      event.respond "Hola <@#{event.user.id}>! 𝘛𝘶𝘦𝘵𝘶𝘥𝘪𝘢𝘵𝘦 𝘦𝘯 𝘦𝘭 𝘱𝘰𝘭𝘪?"
    end
  end

  def run
    at_exit { bot.stop }
    @bot.run
  end
end
