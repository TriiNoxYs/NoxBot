module NoxBot

  module Commands

    # Clear the last N messages.
    module Purge
      extend Discordrb::Commands::CommandContainer
      command([:purge, :p], description: 'Clear the last N messages.', min_args: 1, max_args: 1, required_permissions: [:manage_messages]) do |event, n|
          if n.to_i.to_s == n then event.channel.prune(n.to_i + 1)
          else event.respond(":x: Please enter a correct number.") end
	  return
      end
    end
  end
end
