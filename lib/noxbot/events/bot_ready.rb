module NoxBot
  module Events
    module BotReady
      extend Discordrb::EventContainer
      
      ready do |event|
	      BOT.game = "triinoxys.fr | !help"
      end
    end
  end
end
