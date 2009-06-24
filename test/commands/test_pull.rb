require 'test_helper'

class TestPullCommand < Test::Unit::TestCase
  should "pull out the branch" do
    assert_equal("git pull origin 1-test-ticket", Command::Pull.command_string('1-test-ticket', 1, ['origin']))
  end
  
  should "have usage instructions" do
    assert_equal("lh-branch pull [ticket_id] [remote_name]", Command::Pull.usage)
  end
end