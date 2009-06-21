require 'test_helper'

class TestLighthouseBranch < Test::Unit::TestCase
  context "Tests" do
    setup do
      @lighthouse_branch = LighthouseBranch.new(
                            LIGHTHOUSE_ACCOUNT["account"],
                            LIGHTHOUSE_ACCOUNT["token"],
                            LIGHTHOUSE_ACCOUNT["project"])
      
      @ticket_id = LIGHTHOUSE_ACCOUNT["ticket"]
    end

    should "initialize" do
      assert_not_nil(@lighthouse_branch)
    end
    
    should "return a ticket" do
      assert_not_nil(@lighthouse_branch.ticket(@ticket_id))
      assert_equal(Lighthouse::Ticket, @lighthouse_branch.ticket(@ticket_id).class)
    end
    
    should "give a branch name for the ticket" do
      assert_match(/#{LIGHTHOUSE_ACCOUNT["ticket"]}-[\w-]*/, @lighthouse_branch.branch_name(@ticket_id))
    end
  end
end
