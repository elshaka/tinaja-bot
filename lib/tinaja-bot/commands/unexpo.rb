# frozen_string_literal: true

module TinajaBot
  module Commands
    module Unexpo
      def self.handler
        lambda do |event|
          event.respond "Hola <@#{event.user.id}>! *Tuetudiate en el poli?*"

          nil
        end
      end
    end
  end
end
