# frozen_string_literal: true

require 'wavefile'
require 'pathname'

# Данный модуль, отвечает за запись фразы, в файл в формате .wav
module MorseWave
  include WaveFile

  # Текущий путь к папке с программой
  ORIGINAL_PATH = Pathname(__dir__)

  # Путь необходимый для создания массива путей к файлам.
  # Возвращает в родительский католог
  CURRENT_PATH = File.expand_path('../', ORIGINAL_PATH)

  def self.text_to_wave(text)
    # разбиваем слово на буквы, включая пробелы
    letters = text.downcase.strip.split('')

    # массив путей к файлам
    paths = to_paths_array(letters)

    # проверка существуют ли файлы по заданному пути
    check_paths(paths)

    # создаем имя будущего файла
    file_of_name = generate_file_name

    # cохраняем файл в формате .wav
    write_to_wave(file_of_name, paths)
  end

  private

  # метод который возвращает массив путей к файлам
  def self.to_paths_array(letters)
    # массив путей к файлам
    paths = []

    # массив букв где пробел заменен на 'pause'
    chars = replace_white_space(letters)

    # массив символов где (,.?!) заменены на их названия
    chars = replace_chars(chars)

    # создаем массив путей к файлам
    chars.each { |char| paths << CURRENT_PATH + '/src/sound/' + char + '.wav' }

    # возвращаем массив путей к файлам
    paths
  end

  # метод который заменяет пробелы на 'pause'
  def self.replace_white_space(letters)
    letters.map { |letter| letter == ' ' ? 'pause' : letter }
  end

  # метод который заменяет: (,.?!) на их названия
  def self.replace_chars(letters)
    replacements = {
      ',' => 'comma',
      '.' => 'dot',
      '!' => 'exclamation',
      '?' => 'question'
    }

    letters.map do |letter|
      if replacements.key?(letter)
        replacements[letter]
      else
        letter
      end
    end
  end

  # метод который сохраняет звуки азбуки морзе в один файл
  def self.write_to_wave(file_of_name, paths)
    # создаем папку records, если она не была создана
    # после чего переходим в директорию records
    generate_dir('records')

    # имя подпапки в формате: ('%d-%m-%Y')
    name_of_folder = generate_name_folder

    # создаем подпапку, если она не была создана
    # после чего переходим в директорию
    generate_dir(name_of_folder)

    Writer.new(file_of_name, Format.new(:mono, :pcm_16, 44_100)) do |writer|
      paths.each do |file_name|
        Reader.new(file_name).each_buffer do |buffer|
          writer.write(buffer)
        end
      end
    end
    # возвращаем путь куда был сохранен файл
    "the file was saved to: #{view_save_path}/#{file_of_name}"
  end

  # метод который проверяет, существуют ли файлы по заданному пути
  def self.check_paths(paths)
    paths.each do |path|
      abort "Файл #{path} не найден!" unless File.exist?(path)
    end
  end

  # метод который показывает куда был сохранен файл
  def self.view_save_path
    Dir.pwd
  end

  # метод который отвечает за создание названия файла
  def self.generate_file_name
    Time.now.strftime('%H-%M-%S') + '.wav'
  end

  # метод который отвечает за создание имени папки
  def self.generate_name_folder
    Time.now.strftime('%d-%m-%Y')
  end

  # метод который создает папку, если она не была создана
  # после чего переходит в директорию
  def self.generate_dir(name_of_folder)
    Dir.mkdir(name_of_folder) unless File.exist?(name_of_folder)
    Dir.chdir(name_of_folder)
  end
end
