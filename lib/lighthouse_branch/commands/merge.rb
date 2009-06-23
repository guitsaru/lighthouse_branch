module Command
  class Merge < Command::Base
    command_name :merge
    
    def self.command_string(lighthouse_branch, ticket_id, args)
      "git merge #{lighthouse_branch.branch_name(ticket_id)}"
    end
  end
end