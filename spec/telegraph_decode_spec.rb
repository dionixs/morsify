# frozen_string_literal: true

require 'morsify'

describe Morsify do
  # Тесты для режима decode
  it 'one morse word' do
    expect(Morsify.decode('... --- ...')).to eq 'SOS'
  end

  it 'two morse words' do
    expect(Morsify.decode('... --- ...       ... --- ...')).to eq 'SOS SOS'
  end

  it 'morse to russian text' do
    expect(Morsify.decode(
             '..-.. - ---       .--. .-. --- ... - --- .---       - . ... - .-.-.-', :ru
           )).to eq ('ЭТО ПРОСТОЙ ТЕСТ.')
  end

  it 'punctuation marks' do
    expect(Morsify.decode('.-.-.- --..-- ---... ..--..')).to eq '.,:?'
  end

  it 'basic math operators' do
    expect(Morsify.decode(
             '...-- .-.-. .---- ----- ----- -....- -.--. ..--- -..- ..... -.--.- -..-. .---- ----- -...- ..--- ----. ----.'
           )).to eq(
             '3+100-(2X5)/10=299'
           )
  end

  it 'a seven space separation between morse words' do
    expect(Morsify.decode('.-       -...')).to eq 'A B'
  end

  it 'a single space separation between morse letters' do
    expect(Morsify.decode('.- -...')).to eq 'AB'
  end

  it 'Lorem Ipsum' do
    expect(Morsify.decode(
             '.-.. --- .-. . --       .. .--. ... ..- --       -.. --- .-.. --- .-.       ... .. -       .- -- . -'
           )).to eq ('LOREM IPSUM DOLOR SIT AMET')
  end
end
