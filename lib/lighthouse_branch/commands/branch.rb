module Command
  class Branch < Command::Base
    default_command
    
    def self.command_string(lighthouse_branch, ticket_id, args)
      "git checkout -b #{lighthouse_branch.branch_name(ticket_id)}"
    end
  end
end