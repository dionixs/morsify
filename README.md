## Morsify
Morsify - это библиотека для конвертирования текста в Азбуку Морзе или наоборот.

Одной из ключевых особенностей `gem morsify`, является трансляция между азбукой Морзе и кириллицей.

### Установка

Добавьте эту строку в Gemfile вашего приложения:

```
gem 'morsify'
```

Затем выполните:

```
$ bundle
```

Или установите пакет  `morsify` из [Rubygems](https://rubygems.org/gems/morsify):

```
gem install morsify
```

### Использование

* Между одним символом азбуки морзе, используется один пробел. 

* Между словами отступ равен 7 пробелам.

#### Текст в азбуку Морзе

```ruby
require 'morsify'

text = 'hello'
Morsify.encode(text)
=> ".... . .-.. .-.. ---"

text = 'текст на русском'
Morsify.encode(text)
=> "- . -.- ... -       -. .-       .-. ..- ... ... -.- --- --"
```

#### Код Морзе в кириллицу

```ruby
require 'morsify'

text = "- . -.- ... -       -. .-       .-. ..- ... ... -.- --- --"
Morsify.decode(text, :ru)
=> "ТЕКСТ НА РУССКОМ"
```

#### Код Морзе в латиницу

```ruby
require 'morsify'

text = "... --- ...       ... --- ..."
Morsify.decode(text)
 => "SOS SOS"
```

#### Код Морзе в WAV File

Сохраняет файл в формате .wav в текущую папку, из которой запущен основной файл программы. 

В данной папке, создается подпапка, с именем текущей даты, в формате (ДД-ММ-ГГГГ).

Внутри которой будет сохранен .wav файл,  с именем текущего времени, в формате (ЧЧ-ММ-СС).

```ruby
require 'morsify'

text = "... --- ...       ... --- ..."
Morsify.wave(text)
=> "Generate wave file: current_path/Day-Month-Year/Hour-Min-Sec.wav"
```

#### Терминал

```bash
$> morsify
Select the operation mode: (Use ↑/↓ arrow keys, press Enter to select)
‣ Text to Morse
  Morse to Text
  Text to WAV File
  Exit
```

```bash
$> morsify -h
Usage: morsify [options]
    -h, --help                       Prints this help
    -e, --encode TEXT                Text to Morse
    -d, --decode MORSE_CODE          Morse to Text
    -c, --cyrillic
    -w, --wave MORSE_CODE            Morse to WAV File
```

```bash
$> morsify -e "hello"      
=> ".... . .-.. .-.. ---"

$> morsify -d "... --- ..."
=> "SOS"

$> morsify -d ".--. .-. .. .-- . -" -c
=> "ПРИВЕТ"
```

В случае глобального запуска программы, файл в формате .wav, будет сохранен в домашний каталог.

```bash
$> morsify -w '... --- ...'
=> Generate wave file: /home/user/records/06-03-2020/14-10-09.wav
```

#### Тесты

```
bundle exec rake spec
```

#### Ресурсы

* [Азбука Морзе](https://ru.wikipedia.org/wiki/%D0%90%D0%B7%D0%B1%D1%83%D0%BA%D0%B0_%D0%9C%D0%BE%D1%80%D0%B7%D0%B5)

* [Wavefile](https://github.com/jstrait/wavefile)
