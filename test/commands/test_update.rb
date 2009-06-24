require 'test_helper'

class TestBranchUpdate < Test::Unit::TestCase
  should "Update the ticket" do
    assert_equal("git commit -a -m \"Message.\n\n[#1 tagged:'branch:1-test-ticket']\"",
      Command::Update.command_string('1-test-ticket', 1, ['Message.']))
  end
  
  should "Update the ticket with extra" do
    assert_equal("git commit -a -m \"Message.\n\n[#1 tagged:'branch:1-test-ticket' milestone:'next milestone']\"",
      Command::Update.command_string('1-test-ticket', 1, ['Message.', "milestone:'next milestone'"]))
  end
  
  should "have usage instructions" do
    assert_equal("lh-branch update [ticket_id] [message]", Command::Update.usage)
  end
end