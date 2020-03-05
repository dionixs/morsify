# frozen_string_literal: true

require 'morsify'

describe 'CLI' do
  # Тесты для режима CLI
  it 'encode' do
    expect { system %(morsify -e 'sos') }
    .to output(a_string_including("... --- ..."))
    .to_stdout_from_any_process
  end

  it 'decode' do
    expect { system %(morsify -d '... --- ...') }
    .to output(a_string_including("SOS"))
    .to_stdout_from_any_process
  end

  it 'decode of cyrillic' do
    expect { system %(morsify -d '.--. .-. .. .-- . -' -c) }
    .to output(a_string_including("ПРИВЕТ"))
    .to_stdout_from_any_process
  end

  it 'wave generate' do
    time_regexp = /^[0-2]?[0-9]-[0-6]?[0-9]-[0-6]?[0-9]\.wav$/
    output = `morsify -w '... --- ...'`
    file = output.strip.split('/')[-1]
    expect(time_regexp.match?(file)).to eq true
  end
end