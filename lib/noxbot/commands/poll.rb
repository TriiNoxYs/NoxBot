module NoxBot

  module Commands

    module Poll
      extend Discordrb::Commands::CommandContainer

      command(:poll, description: 'Poll tools.', usage: '!poll Question | answer 1 | answer 2 | others answers..', min_args: 3) do |event, *args|
	event.message.delete

	args = args.join(' ').split('|')
	question = args[0]
	responses = args[1..args.size-1]

	if responses.size > 9
	  event.respond('The max answers count is 9, sorry.')
	  return
	end

        message = event.channel.send_embed do |e|
          e.color = 5800090

	  desc = "🗳️ **#{question}**\n\n"
          responses.each_with_index do |response, index|
            index = index + 1 unless responses.size >= 9
            desc << "#{num_to_emoji(index)} #{response}\n"
          end

          e.description = desc
        end

	responses.each_with_index do |r, index|
          index = index + 1 unless responses.size >= 9
	  message.react(num_to_emoji(index))
	  sleep(0.3)
	end
	
	return
      end

      
      command(:pollyn, description: 'Yes/No poll tools.', usage: '!poll Question', min_args: 1) do |event, *args|
	event.message.delete

        question = args.join(' ')

        message = event.channel.send_embed do |e|
          e.color = 5800090
          e.description = "🗳️ **#{question}**"
        end

	message.react("👍")
	sleep(0.3)
	message.react("👎")

        return
      end


    end
  end
end

private
def num_to_emoji(index)
  case index
    when 0
      "0⃣"
    when 1
      "1⃣"
    when 2
      "2⃣"
    when 3
      "3⃣"
    when 4
      "4⃣"
    when 5
      "5⃣"
    when 6
      "6⃣"
    when 7
      "7⃣"
    when 8
      "8⃣"
    when 9
      "9⃣"
  end
end
