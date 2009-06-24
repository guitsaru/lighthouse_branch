module Command
  class Push < Command::Base
    command_name :push
    number_of_arguments 1
    
    usage "lh-branch push [ticket_id] [remote_name]"
    
    def self.command_string(branch_name, ticket_id, args)
      "git push #{args.shift} #{branch_name}"
    end
  end
end