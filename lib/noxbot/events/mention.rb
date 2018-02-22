module NoxBot
  
  module Events
    # Responds on mention.
    module Mention
      extend Discordrb::EventContainer
      mention do |event|

        event.respond("NoxBot v#{VERSION} at your service!  \n `#{CONFIG.prefix}help` for a list of commandes :desktop:")
      end
    end
  end
end