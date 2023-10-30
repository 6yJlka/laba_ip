# Функция для обработки строки и удаления символов
def process_string(line)
    line.delete!('eErrtU')
    line
  end
  
  # Открываем файл F для чтения и G для записи
  input_file_name = 'C:\Users\Дмитрий\Desktop\IOP_IU6\Laba_7_1\F.txt'
  output_file_name = 'C:\Users\Дмитрий\Desktop\IOP_IU6\Laba_7_1\G.txt'
  
  begin
    File.open(input_file_name, 'r') do |input_file|
      lines = input_file.readlines.reverse
  
      File.open(output_file_name, 'w') do |output_file|
        lines.each do |line|
          output_file.puts(process_string(line))
        end
      end
    end
  
    puts "Файл G успешно создан."
  rescue Errno::ENOENT
    puts "Файл F не найден."
  rescue Exception => e
    puts "Произошла непредвиденная ошибка: #{e.message}"
  end
  