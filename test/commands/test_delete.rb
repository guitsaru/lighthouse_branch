require 'test_helper'

class TestDeleteCommand < Test::Unit::TestCase
  should "delete the branch with no origin name" do
    assert_equal("git branch -d 1-test-ticket", Command::Delete.command_string('1-test-ticket', 1, []))
  end
  
  should "delete the branch with an origin name" do
    assert_equal("git branch -d 1-test-ticket; git push origin :1-test-ticket", 
      Command::Delete.command_string('1-test-ticket', 1, ['origin']))
  end
  
  should "have usage instructions" do
    assert_equal("lh-branch delete [ticket_id] ([remote_name])", Command::Delete.usage)
  end
end