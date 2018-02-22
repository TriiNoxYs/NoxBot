module NoxBot
  
  module Events
    
    module SpeakAsBot
      extend Discordrb::EventContainer
      
      pm(from: CONFIG.owner_id) do |event|
        text = event.message.content
        server = event.bot.servers.values[0]
        bot_profile = event.bot.profile.on(server)
        channel = server.channels[0]
        
        channel.send_message(text) if bot_profile.permission?(:send_messages, channel)
      end
        
    end
  end
end