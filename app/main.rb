# Uncomment this block to pass the first stage
require 'pry'
class Command
  def self.call
    raise NotImplementedError
  end
end

class Echo < Command
  def self.call(args) = $stdout.write("#{args.join(' ')} \n")
end

class Shell

  COMMANDS = %w[exit echo]
  EXECUTORS = {
    "echo" => Echo
  }

  attr_accessor :command, :args

  def self.run 
    new.get_input
  end

  def get_input
    $stdout.write("$ ")
    
    # Wait for user input
    self.command, *self.args = gets.downcase.chomp.split(" ")
    process_input
  end

  def process_input
    return if command == "exit"

    if command_is_valid?(command:)
      EXECUTORS[command].call(args)
    else
      $stdout.write("#{command}: command not found\n")
    end

    get_input
  end

  def command_is_valid?(command:)
    COMMANDS.include?(command)
  end
end

Shell.run
