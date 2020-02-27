#!/usr/bin/env ruby
#
# encoding: UTF-8
#
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

encode = -> (text) { Telegraph.text_to_morse(text) }
decode = -> (morse) { Telegraph.morse_to_text(morse) }
wave = -> (text) { Telegraph::MorseWave.text_to_wave(text) }

options.each do |key, value|
  result = encode.call(value) if key.to_s == 'encode'
  result = decode.call(value) if key.to_s == 'decode'
  result = wave.call(value) if key.to_s == 'wave'
  puts result
  exit if !result.nil?
end

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

  # переключение режимов
  puts Telegraph.text_to_morse(user_input) if mode == 1
  puts Telegraph.morse_to_text(user_input) if mode == 2
  puts Telegraph::MorseWave.text_to_wave(user_input) if mode == 3
end