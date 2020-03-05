# frozen_string_literal: true

require 'morsify'

describe Morsify do
  # Тесты для режима encode
  it 'one word' do
    expect(Morsify.encode('sos')).to eq '... --- ...'
  end

  it 'two words' do
    expect(Morsify.encode('sos sos')).to eq '... --- ...       ... --- ...'
  end

  it 'russian text' do
    expect(Morsify.encode('Это простой тест.')).to eq(
      '..-.. - ---       .--. .-. --- ... - --- .---       - . ... - .-.-.-'
    )
  end

  it 'string of russian letters' do
    expect(Morsify.encode('Это кусок строки русских букв')).to eq(
      '..-.. - ---       -.- ..- ... --- -.-       ... - .-. --- -.- ..       .-. ..- ... ... -.- .. ....       -... ..- -.- .--'
    )
  end

  it 'a simple text' do
    expect(Morsify.encode('Lorem ipsum dolor.')).to eq(
      '.-.. --- .-. . --       .. .--. ... ..- --       -.. --- .-.. --- .-. .-.-.-'
    )
  end

  it 'punctuation marks' do
    expect(Morsify.encode('.,:?')).to eq '.-.-.- --..-- ---... ..--..'
  end

  it 'basic math operators' do
    expect(Morsify.encode('3+100-(2x5)/10=299')).to eq(
      '...-- .-.-. .---- ----- ----- -....- -.--. ..--- -..- ..... -.--.- -..-. .---- ----- -...- ..--- ----. ----.'
    )
  end

  it 'email address' do
    expect(Morsify.encode('morse@mail.ru')).to eq '-- --- .-. ... . .--.-. -- .- .. .-.. .-.-.- .-. ..-'
  end

  it 'a seven space separation between morse words' do
    expect(Morsify.encode('a b')).to eq '.-       -...'
  end

  it 'a single space separation between morse letters' do
    expect(Morsify.encode('ab')).to eq '.- -...'
  end

  it 'unsupported char' do
    expect(Morsify.encode('我是中国人')).to eq '我是中国人'
  end
end
