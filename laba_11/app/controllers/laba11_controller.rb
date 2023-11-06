class Laba11Controller < ApplicationController
    def calculate
      n = params[:n].to_i
  
      if valid_input?(n)
        input_params = { n: n }
  
        # Поиск предыдущего результата
        previous_result = CalculationResult.find_by(input_params: input_params.to_json)
  
        if previous_result
          # Используем сохраненный результат
          @count = 0
          @palindromes = JSON.parse(previous_result.result)
        else
          @palindromes = []
  
          (1..n).each do |i|
            square = i * i
            @palindromes << { number: i, square: square } if PalindromeCount.new.is_palindrome?(square)
          end
  
          @count = @palindromes.size
  
          # Сохранение результата в базу данных
          CalculationResult.create(input_params: input_params.to_json, result: @palindromes.to_json)
        end
      else
        flash[:error] = "Введите целое положительное число для параметра 'n'"
        redirect_to root_path
      end
    end
  
    def xml_result
      n = params[:n].to_i
  
      if valid_input?(n)
        input_params = { n: n }
  
        previous_result = CalculationResult.find_by(input_params: input_params.to_json)
  
        if previous_result
          @count = 0
          @palindromes = JSON.parse(previous_result.result)
          respond_to do |format|
            format.xml do
              render xml: @palindromes.to_xml(root: "palindromes")
            end
          end
        else
          # Если результат не найден, можете вернуть ошибку или другое сообщение.
          respond_to do |format|
            format.xml do
              render xml: { error: "Результат не найден" }.to_xml
            end
          end
        end
      else
        respond_to do |format|
          format.xml do
            render xml: { error: "Введите целое положительное число для параметра 'n'" }.to_xml
          end
        end
      end
    end
  
    private
  
    def valid_input?(n)
      n.is_a?(Integer) && n > 0
    end
  end
  