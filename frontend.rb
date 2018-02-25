require 'Unirest'

require_relative "controllers/boards_controller"
require_relative "views/boards_views"
require_relative "models/board"
require_relative "controllers/words_controller"
require_relative "views/words_views"
require_relative "models/word"

class Frontend
  include BoardsController
  include BoardsViews
  include WordsController
  include WordsViews

def run
  while true
    system "clear"
    puts "This is my Test AAC APP--it doesn't have a name yet!"
    puts "Choose an option to begin"
    puts "[1]   View all boards"
    puts "[2]   See one board"
    puts "[3]   Create a new board"
    puts "[4]   Update a board"
    puts "[5]   Delete a board"

    
    puts "[6]   View all words"
    puts "[7]   See one word"
    puts "[8]   Create a new word"
    puts "[9]   Update a word"
    puts "[10]  Delete a word"


    puts "[signup]  Signup!"
    puts "[login]   Login--it's been a while, crocodile"
    puts "[logout]  Logout--see ya later, alligator."

    puts "[q] quit"

    input_option = gets.chomp

    if input_option == "1"
      boards_index_action

    elsif input_option == "2"
      boards_show_action

    elsif input_option == "3"
      boards_create_action
    
    elsif input_option == "4"
      boards_update_action
    
    elsif input_option == "5"
      boards_destroy_action

    elsif input_option == "6"
      words_index_action

    elsif input_option == "7"
      words_show_action

    elsif input_option == "8"
      words_create_action
    
    elsif input_option == "9"
      words_update_action
    
    elsif input_option == "10"
      words_destroy_action  

    elsif  input_option == "signup"
      puts "Create an account:"
      puts
      client_params = {}
      print "Name: "
      client_params[:name] = gets.chomp
      print "Email: "
      client_params[:email] = gets.chomp
      print "Password: "
      client_params[:password] = gets.chomp
      print "Password confirmation: "
      client_params[:password_confirmation] = gets.chomp

      json data = post_request("/users", client_params)
      puts JSON.pretty_generate(json_data)

    elsif input_option == "login"
      puts "Login"
      puts
      print "Email: "
      input_email = gets.chomp

      print "Password: "
      input_password = gets.chomp

      response = Unirest.post(
                              "http://localhost:3000/user_token",
                              parameters: {
                                            auth: {
                                                  email: input_email,
                                                  password: input_password
                                                  }
                                          }
                            )
      puts JSON.pretty_generate(response.body)
      jwt = response.body["jwt"]
      Unirest.default_header("Authorization", "Bearer #{jwt}")
    elsif input_option == "logout"
      jwt = ""
      Unirest.clear_default_headers
    elsif input_option == "q"
      puts "After a while crocodile!"
      exit
    end
    gets.chomp
  end
end



private
  def get_request(url, client_params={})
    Unirest.get("http://localhost:3000#{url}", parameters: client_params).body
  end

  def post_request(url, client_params={})
    Unirest.post("http://localhost:3000#{url}", parameters: client_params).body
  end

  def patch_request(url, client_params={})
    Unirest.patch("http://localhost:3000#{url}", parameters: client_params).body
  end

  def delete_request(url, client_params={})
    Unirest.delete("http://localhost:3000#{url}", parameters: client_params).body
  end
end