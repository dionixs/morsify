# frozen_string_literal: true

require_relative 'lib/morse'
require_relative 'lib/dictionary'

dictionary = Dictionary.new
content = Morse.new(dictionary.dict, dictionary.decode_dict)

content.switch
puts content.result
