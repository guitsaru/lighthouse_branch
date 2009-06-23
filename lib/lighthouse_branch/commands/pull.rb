module Command
  class Pull < Command::Base
    command_name :pull
    number_of_arguments 1
    
    usage "lh-branch pull [ticket_id] [remote name]"
    
    def self.command_string(lighthouse_branch, ticket_id, args)
      "git pull #{args.shift} #{lighthouse_branch.branch_name(ticket_id)}"
    end
  end
end