#!/usr/bin/env ruby

# frozen_string_literal: true

require 'tty-prompt'
require 'optparse'
require_relative 'lib/morse_code.rb'
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
  opts.on('-w TEXT', '--wave TEXT', 'Text to WAV File') { |o| options[:wave] = o }
end

begin
  optparse.parse!
rescue OptionParser::InvalidOption, OptionParser::MissingArgument
  puts 'Нераспознанный параметр!'
  puts 'По команде «morse -h» можно получить дополнительную информацию.'
  exit
end

# todo: refactoring
unless options[:encode].nil?
  puts Telegraph.text_to_morse(options[:encode])
  exit
end

unless options[:decode].nil?
  puts Telegraph.morse_to_text(options[:decode])
  exit
end

unless options[:wave].nil?
  puts Telegraph::MorseWave.text_to_wave(options[:wave])
  exit
end

# Сценарий на случай того если пользователь
# запустил программу без аргументов командной строки
prompt = TTY::Prompt.new

mode = prompt.select('Select the operation mode:') do |option|
  option.choice name: 'Text to Morse',  value: 1
  option.choice name: 'Morse to Text',  value: 2
  option.choice name: 'Text to WAV File', value: 3
  option.choice name: 'Exit',  value: 4
end

exit if mode == 4

user_input = prompt.ask('Type a text:')

# переключение режимов
puts Telegraph.text_to_morse(user_input) if mode == 1
puts Telegraph.morse_to_text(user_input) if mode == 2
puts Telegraph::MorseWave.text_to_wave(user_input) if mode == 3
