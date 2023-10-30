
def correct_string(input_string)
    words = input_string.split(" ")
    sorted_words = words.sort_by { |word| -word.length }
    corrected_string = sorted_words.join(" ")
    return corrected_string
  end