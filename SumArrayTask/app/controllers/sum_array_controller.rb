class SumArrayController < ApplicationController
    def index
      # Изначальные значения для формы
      @default_values = {
        arr_a: [2, 5, 10, 23, 30, 46, 50]
      }
  
      # Если форма отправлена, обновим значения
      if params[:arr_a]
        # Преобразуем строковые значения в массив чисел
        @default_values[:arr_a] = params[:arr_a].split(',').map(&:to_i)
      end
  
      # Задание: Дан массив чисел arr_a. Найти сумму элементов, кратных 23,
      # и поместить её на место первого четного элемента.
  
      # Найдем сумму элементов, кратных 23
      sum_of_multiples_of_23 = @default_values[:arr_a].select { |num| num % 23 == 0 }.sum
  
      # Найдем индекс первого четного элемента
      index_of_first_even = @default_values[:arr_a].index { |num| num.even? }
  
      # Поместим сумму на место первого четного элемента
      @default_values[:arr_a][index_of_first_even] = sum_of_multiples_of_23
  
      # Рендерим шаблон views/sum_array/index.html.erb
    end
  end
  