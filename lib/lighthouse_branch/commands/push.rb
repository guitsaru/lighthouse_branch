module Command
  class Push < Command::Base
    command_name :push
    number_of_arguments 1
    
    usage "lh-branch push [ticket_id] [remote name]"
    
    def self.command_string(lighthouse_branch, ticket_id, args)
      "git push #{args.shift} #{lighthouse_branch.branch_name(ticket_id)}"
    end
  end
end