require 'test_helper'

class TestPushCommand < Test::Unit::TestCase
  should "pull out the branch" do
    assert_equal("git push origin 1-test-ticket", Command::Push.command_string('1-test-ticket', 1, ['origin']))
  end
  
  should "have usage instructions" do
    assert_equal("lh-branch push [ticket_id] [remote_name]", Command::Push.usage)
  end
end