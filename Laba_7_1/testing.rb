require 'minitest/autorun'
require_relative 'main'

class TestFileProcessing < Minitest::Test
  def setup
    @input_file = 'C:\Users\Дмитрий\Desktop\IOP_IU6\Laba_7_1\F.txt'
    @output_file = 'C:\Users\Дмитрий\Desktop\IOP_IU6\Laba_7_1\G.txt'
  end

  def test_input_file_exists
    assert File.exist?(@input_file), "Файл F.txt не найден"
  end

  def test_process_file
    system("ruby main.rb") # Запустить программу для обработки
    assert File.exist?(@output_file), "Файл G.txt не создан"
    assert_equal expected_result, File.read(@output_file), "Результат обработки файла не соответствует ожидаемому"
  end

  def expected_result
    <<~EXPECTED
      Simply add you x o modify his xampl as you wish.
      
      Also, h x may conain oh chaacs, which will b aind in fil G.
      Th x may conain chaacs , , , , , which will b movd.
      You can plac any x you wan o pocss h.
      This is an xampl x fo fil F.
    EXPECTED
  end
  
end
