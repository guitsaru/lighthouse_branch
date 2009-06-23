module Command
  class DeleteRemote < Command::Base
    command_name :delete_remote
    
    def self.command_string(lighthouse_branch, ticket_id, args)
      "git push #{args.shift} :#{lighthouse_branch.branch_name(ticket_id)}"
    end
  end
end