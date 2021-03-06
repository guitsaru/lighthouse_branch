require 'test_helper'

module Command
  class Base
    @@commands = {}
  end
end

class DefaultCommand < Command::Base
  default_command
end

class NamedCommand < Command::Base
  command_name :named
end

class TestCommandBase < Test::Unit::TestCase
  should "include a list of empty commands on initialization" do
    assert(Command::Base.commands.is_a?(Hash), "Commands is not a hash.")
  end
  
  should "add a default command" do
    assert_equal(DefaultCommand, Command::Base.commands[:default])
  end
  
  should "add a named command" do
    assert_equal(NamedCommand, Command::Base.commands[:named])
  end
  
  should "have a list of regexes to match" do
    assert(Command::Base.command_regexes.include?(/named/i))
    assert(Command::Base.command_regexes.include?(/default/i))
  end
end