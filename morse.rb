class Morse
  def initialize
    @dictionary = {
        'a' => '.-',
        'b' => '-...',
        'c' => '-.-.',
        'd' => '-..',
        'e' => '.',
        'f' => '..-.',
        'g' => '--.',
        'h' => '....',
        'i' => '..',
        'j' => '.---',
        'k' => '-.-',
        'l' => '.-..',
        'm' => '--',
        'n' => '-.',
        'o' => '---',
        'p' => '.--.',
        'q' => '--.-',
        'r' => '.-.',
        's' => '...',
        't' => '-',
        'u' => '..-',
        'v' => '...-',
        'w' => '.--',
        'x' => '-..-',
        'y' => '-.--',
        'z' => '--..',
        ' ' => '',
        '1' => '.----',
        '2' => '..---',
        '3' => '...--',
        '4' => '....-',
        '5' => '.....',
        '6' => '-....',
        '7' => '--...',
        '8' => '---..',
        '9' => '---.',
        '0' => '-----'
    }
    @text = nil
    @result = nil
  end

  def inputStr
    puts "Введите текст для конвертации: "
    str = STDIN.gets.chomp.downcase
    @text = str
    decode(@text)
  end

  def decode(text)
    # разбиваем строку на буквы, включая пробелы
    letters = text.split('')

    convert_letters = []

    # конвертация букв
    letters.each do |item|
      if @dictionary.has_key?(item)
        x = @dictionary[item] + " "
        convert_letters << x
      end
    end

    # результат конвертирования
    puts "Результат:"
    @result = convert_letters.join('')
  end

  def text
    @text
  end

  def result
    @result
  end
end
