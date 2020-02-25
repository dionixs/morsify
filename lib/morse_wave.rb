# frozen_string_literal: true

require 'wavefile'
require 'pathname'

module Telegraph
  # Данный модуль, отвечает за запись фразы в файл, в формате .wav
  module MorseWave
    include WaveFile

    def self.text_to_sound(text)
      text = text.downcase
      # разбиваем слово на буквы, включая пробелы
      letters = text.split('')

      # массив путей к файлам
      paths = []

      original_path = Pathname(__dir__)

      current_path =  File.expand_path('../', original_path)

      # создаем массив путей к файлам
      letters.each do |item|
        paths << if item == ' '
                   # если текущий элемент - пробел, то это означает паузу в 2 сек.
                   current_path + '/src/sound/' + 'separator' + '.wav'
                 else
                   current_path + '/src/sound/' + item + '.wav'
                 end
      end

      # создание .wav файла
      Writer.new('append.wav', Format.new(:stereo, :pcm_16, 44_100)) do |writer|
        paths.each do |file_name|
          Reader.new(file_name).each_buffer do |buffer|
            writer.write(buffer)
          end
        end
      end
    end
  end
end
