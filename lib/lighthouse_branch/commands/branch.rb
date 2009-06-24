module Command
  class Branch < Command::Base
    default_command
    number_of_arguments (0..1)
    
    usage "lh-branch [ticket_id]"
    
    def self.command_string(branch_name, ticket_id, args)
      command_string = "git checkout -b #{branch_name}"
      if remote_name = args.shift
        command_string += "; #{Command::Push.command_string(branch_name, ticket_id, remote_name.to_a)}"
      end
      return command_string
    end
  end
end