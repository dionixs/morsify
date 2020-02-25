# frozen_string_literal: true

require 'translit'

module Telegraph
  include MorseCode

  def self.text_to_morse(text)
    # конвертация, на случай того если слово/текст содержит кириллицу
    text = Translit.convert(text, :english)

    # разбиваем строку на буквы, включая пробелы
    letters = text.split('')

    convert_letters = []

    # конвертация букв
    letters.each do |item|
      if ENCODE_DICT.key?(item)
        x = ENCODE_DICT[item] + ' '
        convert_letters << x
      end
    end

    # результат конвертирования
    convert_letters.join('')
  end

  # Morse to Text
  #
  # Для упрощения в режиме decode:
  # Между одним символом азбуки морзе, используется один пробел.
  # Между словами отступ равен 4 пробелам.
  # К примеру: "... --- ...    ... --- ...".
  def self.morse_to_text(morse)
    # разбиваем строку на массив слов
    words = morse.split('    ')

    # массив, содержащий вложенные массивы
    # в которых слова разбиты на символы азбуки морзе
    letters = []

    # разбиваем слова на символы азбуки морзе
    words.each do |item|
      letters << item.split(' ')
    end

    # массив для хранения расшифрованных букв
    convert_letters = []

    # расшифровка слов
    letters.each do |item|
      item.each do |item|
        convert_letters << DECODE_DICT[item] if DECODE_DICT.key?(item)
      end
      # добавляем пробел после каждого слова
      convert_letters << ' '
    end

    convert_letters.pop

    # результат конвертирования
    convert_letters.join('')
  end
end
