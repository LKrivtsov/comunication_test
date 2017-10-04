require_relative "test"
require_relative "result_printer"
version = "тест - \"Оценка уровня общительности\"."
# Аргумент терминала
name = ARGV[0]
# Код для преобразования входного аргумента в кодировку utf-8 на Windows
if Gem.win_platform? && ARGV[0]
  name = name.encode("UTF-8")
end
# Проверка на анонимность
if name == nil
  name = "Аноним"
end
test = Test.new
result_printer = ResultPrinter.new
puts "Здравструйте #{name}, сейчас вам предстоит пройти #{version}"
until test.finished?
  # Пока тест не закончился, задаем пользователю следующий вопрос методом
  # next_question нашего экземпляра класса Test.
  test.next_question
end
# Вводим результаты теста методом print_result у объекта класса ResultPrinter
result_printer.print_result(test)