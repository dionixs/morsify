# frozen_string_literal: true

require_relative 'lib/morse_code.rb'
require_relative 'lib/telegraph'
require_relative 'lib/morse_wave'

puts "Morse Code: Main Menu\n"
puts "\t1: Text to Morse\n\t2: Morse to Text\n\t3: Text to Audio Morse\n\t4: Exit"

option = nil

until (1..4).include? option
  print 'Your choice: '
  option = STDIN.gets.to_i
end

print 'Type a text: '
user_input = STDIN.gets.chomp.downcase

# переключение режимов
puts Telegraph.text_to_morse(user_input) if option == 1
puts Telegraph.morse_to_text(user_input) if option == 2
Telegraph::MorseWave.text_to_sound(user_input) if option == 3
exit if option == 4

