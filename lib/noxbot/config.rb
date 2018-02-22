module NoxBot
  
  # Holds NoxBot configuration.
  class Config
    require_relative 'store_data'
    include StoreData
  
    def initialize
      @file = "#{Dir.pwd}/data/config.yml"
      temp = load_file(@file)
      @config = temp if temp.is_a?(Hash) && !temp.empty?
      setup_config if @config.nil?
      create_methods
    end

    private

    def setup_config
      @config = {}

      puts 'No configuration file found. Creating it..'
      puts 'Token: '
      @config[:token] = gets.chomp

      puts 'Client/Application ID: '
      @config[:client_id] = gets.chomp

      puts 'Owner ID (default = 131218864234168321)'
      @config[:owner_id] = gets.chomp
      @config[:owner_id] = 131218864234168321 if @config[:owner_id].empty?

      puts 'Commands prefix (default = "!")'
      @config[:prefix] = gets.chomp
      @config[:prefix] = '!' if @config[:prefix].empty?

      puts 'Permissions code (default = 8)'
      @config[:permissions_code] = gets.chomp
      @config[:permissions_code] = 8 if @config[:permissions_code].empty?
      
      puts 'Welcome channel ID'
      @config[:welcome_channel] = gets.chomp
      
      save
    end

    def create_methods
      @config.keys.each do |key|
        self.class.send(:define_method, key) do
          @config[key]
        end
      end
    end

    def save
      save_to_file(@file, @config)
    end
  end
end