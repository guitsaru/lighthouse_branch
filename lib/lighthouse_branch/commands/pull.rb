module Command
  class Pull < Command::Base
    command_name :pull
    
    def self.command_string(lighthouse_branch, ticket_id, args)
      "git pull #{args.shift} #{lighthouse_branch.branch_name(ticket_id)}"
    end
  end
end