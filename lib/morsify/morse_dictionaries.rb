# frozen_string_literal: true

module MorseDictionaries
  LATIN = {
    A: '.-',
    B: '-...',
    C: '-.-.',
    D: '-..',
    E: '.',
    F: '..-.',
    G: '--.',
    H: '....',
    I: '..',
    J: '.---',
    K: '-.-',
    L: '.-..',
    M: '--',
    N: '-.',
    O: '---',
    P: '.--.',
    Q: '--.-',
    R: '.-.',
    S: '...',
    T: '-',
    U: '..-',
    V: '...-',
    W: '.--',
    X: '-..-',
    Y: '-.--',
    Z: '--..'
  }.freeze

  NUMBERS = {
    '0': '-----',
    '1': '.----',
    '2': '..---',
    '3': '...--',
    '4': '....-',
    '5': '.....',
    '6': '-....',
    '7': '--...',
    '8': '---..',
    '9': '----.'
  }.freeze

  PUNCTUATION_MARKS = {
    '.': '.-.-.-',
    ',': '--..--',
    '?': '..--..',
    "'": '.----.',
    '!': '-.-.--',
    '/': '-..-.',
    '(': '-.--.',
    ')': '-.--.-',
    '&': '.-...',
    ':': '---...',
    ';': '-.-.-.',
    '=': '-...-',
    '+': '.-.-.',
    '-': '-....-',
    _: '..--.-',
    '"': '.-..-.',
    '$': '...-..-',
    '@': '.--.-.',
    '¿': '..-.-',
    '¡': '--...-',
    ' ': '     '
  }.freeze

  RUSSIAN = {
    А: '.-',
    Б: '-...',
    В: '.--',
    Г: '--.',
    Д: '-..',
    Е: '.',
    Ж: '...-',
    З: '--..',
    И: '..',
    Й: '.---',
    К: '-.-',
    Л: '.-..',
    М: '--',
    Н: '-.',
    О: '---',
    П: '.--.',
    Р: '.-.',
    С: '...',
    Т: '-',
    У: '..-',
    Ф: '..-.',
    Х: '....',
    Ц: '-.-.',
    Ч: '---.',
    Ш: '----',
    Щ: '--.-',
    Ъ: '--.--',
    Ы: '-.--',
    Ь: '-..-',
    Э: '..-..',
    Ю: '..--',
    Я: '.-.-'
  }.freeze
end