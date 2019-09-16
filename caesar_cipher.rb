def caesar_cipher(string, shift)
    new_string = string.split("").map do |letter|
        shift = shift % 26
        if letter.ord >= 65 && letter.ord <=90
            new_letter_index = letter.ord + shift
            new_letter_index > 90 ? new_letter_index -= 26 : new_letter_index
            new_letter_index < 65 ? new_letter_index += 26 : new_letter_index
            letter = new_letter_index.chr
        elsif letter.ord >= 97 && letter.ord <=122
            new_letter_index = letter.ord + shift
            new_letter_index > 122 ? new_letter_index -= 26 : new_letter_index
            new_letter_index < 97 ? new_letter_index += 26 : new_letter_index
            letter = new_letter_index.chr
        else
            letter
        end
    end
    new_string.join
end
