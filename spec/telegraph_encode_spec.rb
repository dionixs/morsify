# frozen_string_literal: true

require_relative '../lib/morse_dictionaries.rb'
require_relative '../lib/morse_code.rb'
require_relative '../lib/telegraph.rb'

describe Telegraph do

  # Тесты для режима encode
    it 'one word' do
      expect(Telegraph.text_to_morse('sos')).to eq '... --- ...'
    end

    it 'a simple text' do
      expect(Telegraph.text_to_morse('Lorem ipsum dolor.')).to eq(
      '.-.. --- .-. . --       .. .--. ... ..- --       -.. --- .-.. --- .-. .-.-.-')
    end

    it 'punctuation marks' do
       expect(Telegraph.text_to_morse(".,:?")).to eq ".-.-.- --..-- ---... ..--.."
    end

    it 'basic math operators' do
      expect(Telegraph.text_to_morse("3+100-(2x5)/10=299")).to eq(
      "...-- .-.-. .---- ----- ----- -....- -.--. ..--- -..- ..... -.--.- -..-. .---- ----- -...- ..--- ----. ----.")
    end

    it 'email address' do
      expect(Telegraph.text_to_morse("morse@mail.ru")).to eq "-- --- .-. ... . .--.-. -- .- .. .-.. .-.-.- .-. ..-"
    end

    it "a seven space separation between morse words" do
      expect(Telegraph.text_to_morse("a b")).to eq ".-       -..."
    end

    it "a single space separation between morse letters" do
      expect(Telegraph.text_to_morse("ab")).to eq ".- -..."
    end

  

end
