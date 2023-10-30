require_relative 'main'

def get_user_input
  puts "Введите первый операнд:"
  operand1 = gets.to_i
  puts "Введите операцию (+, -, *, /):"
  operation = gets.chomp
  puts "Введите второй операнд:"
  operand2 = gets.to_i

  [operand1, operation, operand2]
end

def main
  puts "Добро пожаловать в программу для работы с тройками!"
  puts "Выберите тип тройки (обычная или в скобках):"
  puts "1. Обычная тройка"
  puts "2. Тройка в скобках"
  choice = gets.to_i

  case choice
  when 1
    operand1, operation, operand2 = get_user_input
    triple = Triple.new(operand1, operand2, operation)
  when 2
    operand1, operation, operand2 = get_user_input
    triple = TripleInBrackets.new(operand1, operand2, operation)
  else
    puts "Неверный выбор."
    return
  end

  puts "Строка тройки: #{triple.string}"
  result = triple.result
  puts "Результат: #{result}" unless result == "Неверная операция"
end

main if __FILE__ == $0
