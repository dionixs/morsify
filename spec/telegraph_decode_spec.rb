require_relative '../lib/morse_dictionaries.rb'
require_relative '../lib/morse_code.rb'
require_relative '../lib/telegraph.rb'

describe Telegraph do

  # Тесты для режима decode
    it 'one morse word' do
      expect(Telegraph.morse_to_text('... --- ...')).to eq 'SOS'
    end

    it 'two morse words' do
      expect(Telegraph.morse_to_text('... --- ...       ... --- ...')).to eq 'SOS SOS'
    end

    it "morse to russian text" do
      expect(Telegraph.morse_to_text(
      '..-.. - ---       .--. .-. --- ... - --- .---       - . ... - .-.-.-', :ru)).to eq (
      'ЭТО ПРОСТОЙ ТЕСТ.')
    end

    it 'punctuation marks' do
       expect(Telegraph.morse_to_text(".-.-.- --..-- ---... ..--..")).to eq ".,:?"
    end

    it 'basic math operators' do
      expect(Telegraph.morse_to_text(
      "...-- .-.-. .---- ----- ----- -....- -.--. ..--- -..- ..... -.--.- -..-. .---- ----- -...- ..--- ----. ----.")).to eq(
      "3+100-(2X5)/10=299")
    end

    it "a seven space separation between morse words" do
      expect(Telegraph.morse_to_text(".-       -...")).to eq "A B"
    end

    it "a single space separation between morse letters" do
      expect(Telegraph.morse_to_text(".- -...")).to eq "AB"
    end

    it "Lorem Ipsum" do
      expect(Telegraph.morse_to_text(
      '.-.. --- .-. . --       .. .--. ... ..- --       -.. --- .-.. --- .-.       ... .. -       .- -- . -')).to eq (
      'LOREM IPSUM DOLOR SIT AMET')
    end
end