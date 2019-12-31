require_relative 'morse'
require_relative 'dictionary'

dictionary = Dictionary.new
content = Morse.new(dictionary.dict, dictionary.decode_dict)

content.mode
content.input_str

puts content.result
content.play
