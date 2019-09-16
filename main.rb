require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'caesar_cipher'

get '/' do
    erb :index, layout: :main_layout
end

get '/show_cipher' do
    message = params['message']
    shift = params['shift']
    encrypted_message = caesar_cipher(message, shift.to_i)
    erb :show_cipher, layout: :main_layout, 
        :locals => {
            :message           => message,
            :encrypted_message => encrypted_message
        }
end
