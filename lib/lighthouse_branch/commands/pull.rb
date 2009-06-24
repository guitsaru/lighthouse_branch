module Command
  class Pull < Command::Base
    command_name :pull
    number_of_arguments 1
    
    usage "lh-branch pull [ticket_id] [remote_name]"
    
    def self.command_string(branch_name, ticket_id, args)
      "git pull #{args.shift} #{branch_name}"
    end
  end
end