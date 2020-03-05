require 'tty-prompt'

module Morsify
  class Prompt
    # Сценарий на случай того если пользователь
    # запустил программу без аргументов командной строки
    def self.tty
      prompt = TTY::Prompt.new

      mode = prompt.select('Select the operation mode:') do |option|
        option.choice name: 'Text to Morse', value: 1
        option.choice name: 'Morse to Text', value: 2
        option.choice name: 'Text to WAV File', value: 3
        option.choice name: 'Exit', value: 4
      end

      exit if mode == 4

      user_input = prompt.ask('Type a text:')

      lang = prompt.ask('Select language for decode (en/ru):', value: "en") if mode == 2

      lang = lang.to_sym if mode == 2

      abort "The current language is not supported!" if MorseCode.lang_support?(lang) && mode == 2

      # переключение режимов
      puts Telegraph.text_to_morse(user_input) if mode == 1
      puts Telegraph.morse_to_text(user_input) if mode == 2 && lang == :en
      puts Telegraph.morse_to_text(user_input) if mode == 2 && lang == :ru
      puts MorseWave.text_to_wave(user_input) if mode == 3
    end
  end
end