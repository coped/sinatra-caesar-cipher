require 'sinatra'
require 'sinatra/reloader' if development?

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

get '/' do
    erb :index, layout: :main
end

get '/show_cipher' do
    message = params['message']
    shift = params['shift']
    encrypted_message = caesar_cipher(message, shift.to_i)
    erb :show_cipher, layout: :main, :locals => {
        :message => message,
        :encrypted_message => encrypted_message
    }
end
