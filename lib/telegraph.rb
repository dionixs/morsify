# frozen_string_literal: true

module Telegraph
  include MorseCode

  def self.text_to_morse(text)
    if !text.nil?
      # массив букв включая пробелы
      letters = to_letters_array(text.strip.upcase)
      # результат конвертирования
      convert_letters(letters).join('').strip
    end
  end

  # Morse to Text
  #
  # В режиме morse_to_text:
  # Между одним символом азбуки морзе, используется один пробел.
  # Между словами отступ равен 7 пробелам.
  # К примеру: "... --- ...        ... --- ...".
  def self.morse_to_text(morse, language = :en)
    if !morse.nil?
      # выбор словаря для расшифровки
      dict = MorseCode.choose_dictionary(language)

      # массив слов
      words = to_words_array(morse)

      # массив, содержащий вложенные массивы
      # в которых слова разбиты на символы азбуки морзе
      letters = words_to_morse_char(words)

      # массив расшифрованных букв
      convert_letters = decode_chars(dict, letters)

      # результат конвертирования
      convert_letters.join('')
    end
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
      letter = item.to_sym

      if ENCODE_DICT.key?(letter)
        convert_letters << LETTER_SPACE if letter != LETTER_SPACE
        convert_letters << ENCODE_DICT[letter]
      end
    end

    convert_letters
  end

  # метод который разбивает строку на массив слов
  def self.to_words_array(morse)
    morse.split(' ' * 7)
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
  def self.decode_chars(dict, letters)
    # массив для хранения расшифрованных букв
    convert_letters = []

    # расшифровка слов
    letters.each do |item|
      item.each do |item|
        convert_letters << dict[item] if dict.key?(item)
      end
      # добавляем пробел после каждого слова
      convert_letters << ' '
    end

    # удаляем последний элемент массива
    convert_letters.delete_at(-1)

    # результат конвертирования
    convert_letters
  end
end
