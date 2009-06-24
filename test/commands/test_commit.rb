require 'test_helper'

class TestBranchCommit < Test::Unit::TestCase
  should "Commit the branch" do
    assert_equal("git commit -a -m \"Message\n\n[#1]\"",
      Command::Commit.command_string('1-test-ticket', 1, ['Message']))
  end
  
  should "have usage instructions" do
    assert_equal("lh-branch commit [ticket_id] [message]", Command::Commit.usage)
  end
end