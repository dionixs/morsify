# frozen_string_literal: true

require 'morsify'

describe Morsify do
  it 'wave generate' do
    text = '... --- ...       ... --- ...'
    time_regexp = /^[0-2]?[0-9]-[0-6]?[0-9]-[0-6]?[0-9]\.wav$/
    result = Morsify.wave(text)
    expect(time_regexp.match?(result.split('/')[-1])).to eq true
  end
end
