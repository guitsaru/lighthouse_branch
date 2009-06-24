require 'test_helper'

class TestCheckoutCommand < Test::Unit::TestCase
  should "check out the branch" do
    assert_equal("git checkout 1-test-ticket", Command::Checkout.command_string('1-test-ticket', 1, []))
  end
  
  should "have usage instructions" do
    assert_equal("lh-branch checkout [ticket_id]", Command::Checkout.usage)
  end
end