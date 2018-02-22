module NoxBot
  
  # Module for NoxBot commands.
  module Commands
    # Require files from directory
    Dir["#{File.dirname(__FILE__)}/commands/*.rb"].each { |file| require file }
    
    @commands = [
      About,
      Purge,
      Poll,
      Avatar,
      Emoji
    ]

    def self.include!
      @commands.each do |command|
        NoxBot::BOT.include!(command)
      end
    end
  end
end
