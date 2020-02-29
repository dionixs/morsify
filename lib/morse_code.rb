module MorseCode
  include MorseDictionaries

  ENCODE_DICT = LATIN.merge(RUSSIAN).merge(NUMBERS).merge(PUNCTUATION_MARKS)

  RU_DECODE_DICT = RUSSIAN.merge(NUMBERS).merge(PUNCTUATION_MARKS).invert

  EN_DECODE_DICT = LATIN.merge(NUMBERS).merge(PUNCTUATION_MARKS).invert

  # выбор словаря для расшифровки
  def self.choose_dictionary(language)
    if language == :en
      EN_DECODE_DICT
    else
      RU_DECODE_DICT
    end
  end
end