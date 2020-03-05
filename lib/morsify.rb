require 'morsify/version'
require 'morsify/morse_dictionaries'
require 'morsify/morse_code'
require 'morsify/telegraph'
require 'morsify/morse_wave'
require 'morsify/cli'
require 'morsify/prompt'

module Morsify
  def self.encode(text)
    Telegraph.text_to_morse(text)
  end

  def self.decode(morse, lang = :en)
    Telegraph.morse_to_text(morse, lang)
  end

  def self.wave(morse)
    MorseWave.text_to_wave(morse)
  end
end
