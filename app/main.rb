# Uncomment this block to pass the first stage
require 'pry'

# class Command
#   def self.call =raise NotImplementedError
# end

# class Echo < Command
#   def self.call(args) = $stdout.write("#{args.join(' ')} \n")
# end

# class Type < Command
#   def self.call(args) 
#      if recognized_command?(command: args[0])
#       $stdout.write("#{args[0]} is a shell builtin\n")
#      else
#       $stdout.write("#{args[0]}: command not found\n")
#      end
#   end
# end

class Shell
  COMMANDS = %w[exit echo type] # probably drop this
  # EXECUTORS = {
  #   "echo" => Echo,
  #   "type" => Type,
  #   "exit" => nil,
  # }

  attr_accessor :command, :args

  def self.run 
    new.get_input
  end

  def get_input
    $stdout.write("$ ")
    self.command, *self.args = gets.downcase.chomp.split(" ")
    process_input
  end

  def process_input
    case command
    when "exit"
      return
    when "echo"
      $stdout.write("#{args.join(' ')} \n")
    when "type"
      if recognized_command?(command: args[0])
        $stdout.write("#{args[0]} is a shell builtin\n")
      else
        $stdout.write("#{args[0]}: not found\n")
      end       
    else
      $stdout.write("#{command}: command not found\n")
    end

    get_input
  end

  def recognized_command?(command:)
    COMMANDS.include?(command)
  end
end

Shell.run