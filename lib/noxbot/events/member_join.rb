module NoxBot
  module Events

    # Greet new users
    module JoinMessage
      extend Discordrb::EventContainer
      member_join do |event|
        event.server.text_channels.select{ |channel| channel.id == CONFIG.welcome_channel }[0].send_message("Hop hop, we have a new one here!  \nWelcome to <@#{event.member.id}> :smiley:")
      end
    end

    module AutoRole
      extend Discordrb::EventContainer

      member_join do |event|
        #event.user.add_role('<AUTOROLE-ID>') unless event.user.bot_account
      end
    end

  end
end
