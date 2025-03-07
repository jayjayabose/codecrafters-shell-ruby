# Uncomment this block to pass the first stage
require 'pry'
class Shell

  COMMANDS = %w[exit echo]

  attr_accessor :command, :args

  def self.run 
    new.get_input
  end

  def get_input
    $stdout.write("$ ")
    
    # Wait for user input
    self.command, *self.args = gets.chomp.split(" ")
    validate_command
    
  end

  def validate_command
    return if command.downcase == "exit"

    if command.downcase == "echo"
      $stdout.write("#{args.join(' ')} \n") 
    else
      $stdout.write("#{command}: command not found\n")
    end

    get_input
  end
end

Shell.run
