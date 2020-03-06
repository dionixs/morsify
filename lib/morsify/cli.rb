# frozen_string_literal: true

require 'optparse'

module Morsify
  class Parser
    def self.parse(_args)
      options = {}

      optparse = OptionParser.new do |opts|
        opts.banner = 'Usage: morsify [options]'

        opts.on('-h', '--help', 'Prints this help') do
          puts opts
          exit
        end

        opts.on('-e TEXT', '--encode TEXT', 'Text to Morse') { |o| options[:encode] = o }
        opts.on('-d MORSE_CODE', '--decode MORSE_CODE', 'Morse to Text') { |o| options[:decode] = o }
        opts.on('-c', '--cyrillic') { |o| options[:ru] = o }
        opts.on('-w MORSE_CODE', '--wave MORSE_CODE', 'Morse to WAV File') { |o| options[:wave] = o }
      end

      begin
        optparse.parse!
      rescue OptionParser::InvalidOption, OptionParser::MissingArgument
        puts 'Нераспознанный параметр!'
        puts 'По команде «morsify -h» можно получить дополнительную информацию.'
        exit
      end

      options
    end

    def self.handler(options)
      encode = ->(text) { Telegraph.text_to_morse(text) }
      decode = ->(morse) { Telegraph.morse_to_text(morse) }
      to_cyrillic = ->(morse, lang) { Telegraph.morse_to_text(morse, lang) }
      wave = ->(text) { MorseWave.text_to_wave(text) }

      puts encode.call(options[:encode]) if options[:encode]
      puts decode.call(options[:decode]) if options[:decode] && !options[:ru]

      if options[:decode] && options[:ru]
        puts to_cyrillic.call(options[:decode], options[:ru])
      end

      puts wave.call(options[:wave]) if options[:wave]
    end
  end
end
