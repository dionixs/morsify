class Morse
  def initialize
    @dict = {
        'а' => '.-',
        'б' => '-···',
        'в' => '.--',
        'г' => '--.',
        'д' => '-..',
        'е' => '.',
        'ж' => '...-',
        'з' => '--..',
        'и' => '..',
        'й' => '.---',
        'к' => '-.-',
        'л' => '.-..',
        'м' => '--',
        'н' => '-.',
        'о' => '---',
        'п' => '.--.',
        'р' => '.-.',
        'с' => '...',
        'т' => '-',
        'у' => '..-',
        'ф' => '..-.',
        'х' => '....',
        'ц' => '-.-.',
        'ч' => '---.',
        'ш' => '----',
        'щ' => '--.-',
        'ъ' => '--.--',
        'ы' => '-.--',
        'ь' => '-.--',
        'э' => '..-..',
        'ю' => '..--',
        'я' => '.-.-',
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
    @encode_dict = @dict.invert
    @text = nil
    @result = nil
  end

  def inputStr
    puts "Введите текст для конвертации: "
    print ">> "
    str = STDIN.gets.chomp.downcase
    @text = str
    #decode(@text)
    #encode(@text)
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
        if @encode_dict.has_key?(item)
          convert_letters << @encode_dict[item]
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
