class RunProgram

  def initialize
    @position = PositionCommand.new(start_position)
    @position.process_command(command)
  end

# Gets the original location of the robot
  def start_position
    position = ""
    get_input_for("Welcome! Enter starting position (ex. Place 0,0,North)") do |input|
      position = input
      input_position = position.match(/[a-zA-Z]{5} \d,\d,\w*/).to_s.split(',')
      input_position.size == 3
    end
    position
  end

# Gets the commands in and array
  def command
    command = []
    i = 0
    until command[i-1] == "REPORT"
      get_input_for("Enter Commands (ex. Move)") do |input|
        command[i] = input.upcase
        i = i + 1
        !command.nil?
      end
    end
    command
  end

  protected

  def get_input_for(message)
    valid = false
    begin
      puts message
      valid = yield gets.chomp
    end until valid == true
  end
end
