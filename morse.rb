require 'translit'

class Morse
  def initialize(dict, decode_dict)
    @dict = dict
    @decode_dict = decode_dict
    @text = nil
    @result = nil
  end

  # Режимы работы
  def switch
    puts "Morse Code: Main Menu\n"
    puts "\t1: Text to Morse\n\t2: Morse to Text\n\t3: Text to Audio Morse\n\t4: Exit"

    option = nil

    until (1..4).include? option
      print "Your choice: "
      option = STDIN.gets.to_i
    end

    # переключение режимов
    encode if option == 1
    decode if option == 2
    play if option == 3

    exit if option == 4
  end

  # получение строки введенной пользователем
  def get_string
    print 'Type a text: '
    str = STDIN.gets.chomp.downcase
    @text = str
  end

  # Text to Morse
  def encode
    # получаем строку
    get_string

    # конвертация, на случай того если слово/текст содержит кириллицу
    @text = Translit.convert(@text, :english)

    # разбиваем строку на буквы, включая пробелы
    letters = @text.split('')

    convert_letters = []

    # конвертация букв
    letters.each do |item|
      if @dict.key?(item)
        x = @dict[item] + ' '
        convert_letters << x
      end
    end

    # результат конвертирования
    puts 'Result:'
    @result = convert_letters.join('')
  end

  # Morse to Text
  #
  # Для упрощения в режиме decode:
  # Между одним символом азбуки морзе, используется один пробел.
  # Между словами отступ равен 4 пробелам.
  # К примеру: "... --- ...    ... --- ...".
  def decode
    # получаем строку
    get_string

    # разбиваем строку на массив слов
    words = @text.split('    ')

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
        convert_letters << @decode_dict[item] if @decode_dict.key?(item)
      end
      # добавляем пробел после каждого слова
      convert_letters << ' '
    end

    convert_letters.pop

    print 'Result: '
    @result = convert_letters.join('')
  end

  # Text to Audio Morse
  def play
    # получаем строку
    get_string

    # разбиваем слово на буквы, включая пробелы
    letters = @text.split('')

    # массив путей к файлам
    paths = []

    # абсолютный путь к папке с программой
    current_path = __dir__

    # создаем массив путей к файлам
    letters.each do |item|
      if item == " "
        paths << item
      else
        paths << current_path + '/sound/' + item + '.ogg'
      end
    end

    # проигрываем звуки которые содержатся в слове
    paths.size.times do |i|
      # если текущий элемент - пробел, то это означает паузу в 2 сек.
      if paths[i] == " "
        sleep 2
      else
        system('play ' + paths[i])
        sleep 0.5
      end
    end
  end

  attr_reader :result
end
