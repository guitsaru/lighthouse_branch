module Command
  class Delete < Command::Base
    command_name :delete
    
    def self.command_string(lighthouse_branch, ticket_id, args)
      "git branch -d #{lighthouse_branch.branch_name(ticket_id)}"
    end
  end
end