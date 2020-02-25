# frozen_string_literal: true

require_relative '../lib/morse_code.rb'
require_relative '../lib/telegraph.rb'

describe Telegraph do
  it 'should do true' do
    expect(Telegraph.text_to_morse('sos')).to eq '... --- ...'
  end

  it 'should do true' do
    expect(Telegraph.text_to_morse('This is a test')).to eq '.... .. ...    .. ...    .-    - . ... -'
  end

  it 'should do true' do
    expect(Telegraph.morse_to_text('.... . .-.. .-.. ---    .-- --- .-. .-.. -..')).to eq 'hello world'
  end
end
