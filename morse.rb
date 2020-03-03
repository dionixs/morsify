#!/usr/bin/env ruby
# frozen_string_literal: true

require 'tty-prompt'
require 'optparse'
require_relative 'lib/morse_dictionaries.rb'
require_relative 'lib/morse_code'
require_relative 'lib/telegraph'
require_relative 'lib/morse_wave'

options = {}

optparse = OptionParser.new do |opts|
  opts.banner = 'Usage: morse.rb [options]'

  opts.on('-h', '--help', 'Prints this help') do
    puts opts
    exit
  end

  opts.on('-e TEXT', '--encode TEXT', 'Text to Morse') { |o| options[:encode] = o }
  opts.on('-d MORSE_CODE', '--decode MORSE_CODE', 'Morse to Text') { |o| options[:decode] = o }
  opts.on('-c', '--cyrillic') { |o| options[:ru] = o }
  opts.on('-w TEXT', '--wave TEXT', 'Text to WAV File') { |o| options[:wave] = o }
end

begin
  optparse.parse!
rescue OptionParser::InvalidOption, OptionParser::MissingArgument
  puts 'Нераспознанный параметр!'
  puts 'По команде «morse -h» можно получить дополнительную информацию.'
  exit
end

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

# Сценарий на случай того если пользователь
# запустил программу без аргументов командной строки
if options == {}
  prompt = TTY::Prompt.new

  mode = prompt.select('Select the operation mode:') do |option|
    option.choice name: 'Text to Morse', value: 1
    option.choice name: 'Morse to Text', value: 2
    option.choice name: 'Text to WAV File', value: 3
    option.choice name: 'Exit', value: 4
  end

  exit if mode == 4

  user_input = prompt.ask('Type a text:')

  lang = prompt.ask('Select language for decode (en/ru):') if mode == 2

  lang = if lang.nil?
           :en
         else
           lang.to_sym
         end

  if mode == 2 && lang != :en && lang != :ru
    abort "The current language is not supported"
  end

  # переключение режимов
  puts encode.call(user_input) if mode == 1
  puts Telegraph.morse_to_text(user_input, lang) if mode == 2
  puts wave.call(user_input) if mode == 3
end
