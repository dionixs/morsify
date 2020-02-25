# frozen_string_literal: true

require "tty-prompt"
require_relative 'lib/morse_code.rb'
require_relative 'lib/telegraph'
require_relative 'lib/morse_wave'

prompt = TTY::Prompt.new

mode = prompt.select('Select the operation mode:') do |mode|
  mode.choice name: 'Text to Morse',  value: 1
  mode.choice name: 'Morse to Text',  value: 2
  mode.choice name: 'Text to WAV File',  value: 3
  mode.choice name: 'Exit',  value: 4
end

exit if mode == 4

user_input = prompt.ask("Type a text:")

# переключение режимов
puts Telegraph.text_to_morse(user_input) if mode == 1
puts Telegraph.morse_to_text(user_input) if mode == 2
Telegraph::MorseWave.text_to_sound(user_input) if mode == 3

