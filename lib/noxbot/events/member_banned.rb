module NoxBot
  module Events

    # Announce bans
    module BanMessage
      extend Discordrb::EventContainer
      user_ban do |event|
        event.server.text_channels.select{ |channel| channel.id == CONFIG.welcome_channel }[0].send_message("<@#{event.user.id}> was banned! :dizzy_face:")
      end
    end
  end
end