1.Реализовать народную игру «Виселица»
Напишите консольную версию игры, которая запускается в консоли для одного игрока.

 

У вас есть список слов, из которого случайным образом выбирается слово для игры.

Необходимо отрисовать "таблицу", используя какие-либо символы, например \u25A0 по количеству букв в выбранном слове: ■ ■ ■ ■ ■ или просто использовать подчёркивания: _ _ _ _ _.

Далее, следовать правилам игры, предлагая игроку ввести букву.

Если буква правильная, то "таблица" перерисовывается с видимой буквой.

Если буква неправильная, то в консоли отрисовывается элемент виселицы.

Если игрок ввёл слово и это слово правильно, либо это последняя правильная буква, либо игрока «повесили», то игра заканчивается.

 

Попробуйте избежать «спагетти-кода».

Сначала опишите логику программы используя декомпозицию задачи.

За каждое действие должна отвечать своя функция. Помните, что функция должна делать какое-либо одно действие.

Потом опишите необходимые функции.

 

Попробуйте использовать вместо списка слов словарь: слово и его описание, чтобы игроку было легче угадывать.

Попробуйте сделать заготовки элементов виселицы в виде файлов, которые зачитываются в нужный момент.

Предложите игроку после каждого тура сыграть ещё или отказаться.

Пусть игра идёт до тех пор, пока не закончатся слова в списке (или игрок откажется).