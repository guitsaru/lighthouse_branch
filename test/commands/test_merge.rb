require 'test_helper'

class TestMergeCommand < Test::Unit::TestCase
  should "merge out the branch" do
    assert_equal("git merge 1-test-ticket", Command::Merge.command_string('1-test-ticket', 1, []))
  end
  
  should "have usage instructions" do
    assert_equal("lh-branch merge [ticket_id]", Command::Merge.usage)
  end
end