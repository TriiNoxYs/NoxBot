module NoxBot

  module Commands

    module Avatar
      extend Discordrb::Commands::CommandContainer

      command(:avatar, description: 'Show a big version of an avatar.', usage: '!avatar <user>', min_args: 1, max_args: 2) do |event, *args|
        if event.message.mentions.empty?
          event.respond("Please tag the user you want to get the avatar from.")
          return
        end

        user = event.message.mentions[0]
        size = '1024'
        size = args[1] if args.size == 2
        event.respond("#{user.avatar_url('png')}?size=#{size}")

        #IO.copy_stream(open(url), 'data/avatars/#{id}.png')
      end
    end
  end
end
