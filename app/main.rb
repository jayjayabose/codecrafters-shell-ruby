# Uncomment this block to pass the first stage
class Shell

  def self.run 
    new.get_input
  end

  def get_input
    $stdout.write("$ ")
    # Wait for user input
    command, *args = gets.chomp.split(" ")
    validate_command(command:)
  end

  def validate_command(command:)
    $stdout.write("#{command}: command not found\n")
  end
end

Shell.run
