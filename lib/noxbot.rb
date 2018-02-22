require 'uri'
require 'yaml'
require 'fileutils'
require 'open-uri'
require 'json'

# libsodium (voice)
::RBNACL_LIBSODIUM_GEM_LIB_PATH = "D:\\Documents\\Dev\\Ruby\\libsodium.dll"

# Gems.
require 'bundler/setup'

Bundler.require(:default)


# Methods that should be accessible everywhere.
module Kernel

  # Converts seconds to human readable format.
  def time_in_words(time)
    days = (time / 86_400).to_i
    time -= days * 86_400
    hours = (time / 3600).to_i
    time -= hours * 3600
    minutes = (time / 60).to_i
    string = "#{days} jour#{'s' unless days == 1},"
    string << " #{hours} heure#{'s' unless hours == 1},"
    string << " #{minutes} minute#{'s' unless minutes == 1}"
  end

  # Converts boolean values to more appealing format.
  # Possible modes: on, enabled.
  def bool_to_words(bool, mode = :on)
    case mode
    when :on
      string_if_true = 'on'
      string_if_false = 'off'
    when :enabled
      string_if_true = 'enabled'
      string_if_false = 'disabled'
    else
      raise ArgumentError
    end

    return string_if_true if bool
    string_if_false
  end

  # Returns true if specified url string is valid.
  def valid_url?(url)
    uri = URI.parse(url)
    return true if uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
    false
  rescue
    false
  end

  # Returns urls host.
  def url_host(url)
    URI.parse(url).host
  rescue
    nil
  end

  # Generates a random string with default length of 10.
  def rand_string(length = 10)
    rand(36**length).to_s(36)
  end
end


# Base module for NoxBot.
module NoxBot
  require_relative 'noxbot/config'

  CONFIG = Config.new

  Dir["#{File.dirname(__FILE__)}/noxbot/*.rb"].each { |file| require file }

  BOT = Discordrb::Commands::CommandBot.new(token: CONFIG.token,
                                            application_id: CONFIG.client_id,
                                            prefix: CONFIG.prefix,
                                            advanced_functionality: false,
                                            fancy_log: true)

  BOT.name = 'NoxBot'


  # Set roles/users Permissions, define Commands and Events. 
  # See lib/noxbot/commands.rb, lib/noxbot/events.rb and lib/noxbot/permissions.rb
  Permissions.set!
  Commands.include!
  Events.include!

  at_exit do
    # LOGGER.info 'Stopping the bot...'
    exit!
  end

  # LOGGER.info "Oauth URL: #{BOT.invite_url}+&permissions=#{CONFIG.permissions_code}"
  # LOGGER.info 'Use Ctrl+C to stop the bot.'
  BOT.run

end
