require_relative 'morse'
require_relative 'dictionary'

dictionary = Dictionary.new
content = Morse.new(dictionary.dict, dictionary.decode_dict)

content.switch
puts content.result
