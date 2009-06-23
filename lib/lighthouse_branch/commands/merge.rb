module Command
  class Merge < Command::Base
    command_name :merge
    number_of_arguments 0
    
    usage "lh-branch merge [ticket_id]"
    
    def self.command_string(lighthouse_branch, ticket_id, args)
      "git merge #{lighthouse_branch.branch_name(ticket_id)}"
    end
  end
end