class Morse
  def initialize
    @dict = {
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
        ' ' => '  ',
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
    @decode_dict = @dict.invert
    @option = nil
    @text = nil
    @result = nil
  end

  def mode
    option = nil

    until (1..2).include? option
      print "Choose operation mode (1 - encode / 2 - decode): "
      option = STDIN.gets.to_i
    end
    @option = option
  end

  def inputStr
    puts "Type a text: "
    str = STDIN.gets.chomp.downcase
    @text = str

    @option == 1 ? encode(@text) : decode(@text)
  end

  def encode(text)
    # разбиваем строку на буквы, включая пробелы
    letters = text.split('')

    convert_letters = []

    # конвертация букв
    letters.each do |item|
      if @dict.has_key?(item)
        x = @dict[item] + " "
        convert_letters << x
      end
    end

    # результат конвертирования
    puts "Результат:"
    @result = convert_letters.join('')
  end

  def decode(text)
    words = text.split("    ")

    letters = []

    words.each do |item|
      letters << item.split(" ")
    end

    convert_letters = []

    letters.each do |item|
      item.each do |item|
        if @decode_dict.has_key?(item)
          convert_letters << @decode_dict[item]
        end
      end
      convert_letters << " "
    end

    convert_letters.pop

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
