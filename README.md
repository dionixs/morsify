# Азбука Морзе
Реализация переводчика Азбуки Морзе на языке Ruby.
Режимы работы
-------------------------
###Text to Morse
Конвертация текста в код Азбуки Морзе.

Пример использования:

```
Type a text: hello
Result: .... . .-.. .-.. --- 
```

######Morse to Text
Расшифровка текста из кодов азбуки морзе.

Пример использования:

```
Type a text: .... . .-.. .-.. ---
Result: hello
```

Для упрощения в данном режиме:

Между одним символом азбуки морзе, используется один пробел.

Между словами отступ равен 4 пробелам.


######Text to Audio Morse
Трансляция текста в звуковые сигналы.

### Использование
Для запуска необходимо: 
1) установить утилиту sox и зависимости к ней:

`sudo apt install sox libsox-fmt-mp3`

2) установить гем [translate](https://github.com/tjbladez/translit):

`gem install translit`

######Запуск:

```ruby main.rb```
