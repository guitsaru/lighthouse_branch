require 'test_helper'

class TestBranchCommand < Test::Unit::TestCase
  should "create the branch with no arguments" do
    assert_equal("git checkout -b 1-test-ticket", \
      Command::Branch.command_string('1-test-ticket', 1, []))
  end
  
  should "create the branch and push to remote with an argument" do
    assert_equal("git checkout -b 1-test-ticket; git push origin 1-test-ticket", 
      Command::Branch.command_string('1-test-ticket', 1, ['origin']))
  end
  
  should "have usage instructions" do
    assert_equal("lh-branch [ticket_id]", Command::Branch.usage)
  end
end