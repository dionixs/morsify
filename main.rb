# frozen_string_literal: true

require_relative 'lib/morse_code.rb'
require_relative 'lib/morse'

content = Morse.new
content.switch
puts content.result
