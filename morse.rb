class Morse
  def initialize(dict, decode_dict)
    @dict = dict
    @decode_dict = decode_dict
    @option = nil
    @text = nil
    @result = nil
  end

  def mode
    option = nil

    until (1..2).include? option
      print 'Choose operation mode (1 - encode / 2 - decode): '
      option = STDIN.gets.to_i
    end
    @option = option
  end

  def input_str
    puts 'Type a text: '
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
      if @dict.key?(item)
        x = @dict[item] + ' '
        convert_letters << x
      end
    end

    # результат конвертирования
    puts 'Результат:'
    @result = convert_letters.join('')
  end

  def decode(text)
    words = text.split('    ')

    letters = []

    words.each do |item|
      letters << item.split(' ')
    end

    convert_letters = []

    letters.each do |item|
      item.each do |item|
        convert_letters << @decode_dict[item] if @decode_dict.key?(item)
      end
      convert_letters << ' '
    end

    convert_letters.pop

    puts 'Результат:'
    @result = convert_letters.join('')
  end

  def sound
    letters = @text.split('')

    paths = []

    current_path = __dir__

    letters.each do |item|
      paths << current_path + '/sound/' + item + '.ogg'
    end

    paths.size.times do |i|
      system('play ' + paths[i])
      sleep 1
    end
  end

  attr_reader :text

  attr_reader :result
end
