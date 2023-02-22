require_relative './app'

def main
  puts
  puts 'Welcome to School Library!'
  puts
  @app = App.new
  @app.process
end

main
