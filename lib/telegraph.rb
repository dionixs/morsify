# frozen_string_literal: true

require 'translit'

module Telegraph
  include MorseCode

  def self.text_to_morse(text)
    # конвертация, на случай того если слово/текст содержит кириллицу
    text = Translit.convert(text.downcase, :english)

    # массив букв включая пробелы
    letters = to_letters_array(text)

    # результат конвертирования
    convert_letters(letters).join('').strip
  end

  # Morse to Text
  #
  # Для упрощения в режиме morse_to_text:
  # Между одним символом азбуки морзе, используется один пробел.
  # Между словами отступ равен 4 пробелам.
  # К примеру: "... --- ...    ... --- ...".
  def self.morse_to_text(morse)
    # массив слов
    words = to_words_array(morse)

    # массив, содержащий вложенные массивы
    # в которых слова разбиты на символы азбуки морзе
    letters = words_to_morse_char(words)

    # массив расшифрованных букв
    convert_letters = decode_chars(letters)

    # удаляем последний элемент массива
    convert_letters.pop

    # результат конвертирования
    convert_letters.join('')
  end

  private

  # метод который разбивает строку на буквы, включая пробелы
  def self.to_letters_array(string)
    string.split('')
  end

  # метод который конвертирует массив букв, в символы азбуки Морзе
  def self.convert_letters(letters)
    convert_letters = []

    letters.each do |item|
      if ENCODE_DICT.key?(item)
        x = ENCODE_DICT[item] + ' '
        convert_letters << x
      end
    end
    convert_letters
  end

  # метод который разбивает строку на массив слов
  def self.to_words_array(morse)
    morse.split('    ')
  end

  # метод который разбивает слова, на символы азбуки морзе
  def self.words_to_morse_char(words)
    # массив, содержащий вложенные массивы
    # в которых слова разбиты на символы азбуки морзе
    chars = []

    # разбиваем слова на символы азбуки морзе
    words.each do |item|
      chars << item.split(' ')
    end
    chars
  end

  # метод который возвращает массив расшифрованных букв
  def self.decode_chars(letters)
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
    convert_letters
  end
end
