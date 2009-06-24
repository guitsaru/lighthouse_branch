require 'test_helper'

class TestResolveCommand < Test::Unit::TestCase
  should "resolve the ticket" do
    assert_equal("git commit -a -m \"Message.\n\n[#1 state:resolved]\"", 
      Command::Resolve.command_string('1-test-ticket', 1, ['Message.']))
  end
  
  should "have usage instructions" do
    assert_equal("lh-branch resolve [ticket_id] [message]", Command::Resolve.usage)
  end
end