# frozen_string_literal: true

require_relative '../lib/morse_dictionaries'
require_relative '../lib/morse_code'
require_relative '../lib/telegraph'
require_relative '../lib/morse_wave'

describe MorseWave do
  it 'wave generate' do
    text = '... --- ...       ... --- ...'
    time_regexp = /^[0-2]?[0-9]-[0-6]?[0-9]-[0-6]?[0-9]\.wav$/
    result = MorseWave.text_to_wave(text)
    expect(time_regexp.match?(result.split('/')[-1])).to eq true
  end
end
