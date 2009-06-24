module Command
  class Delete < Command::Base
    command_name :delete
    number_of_arguments (0..1)
    
    usage "lh-branch delete [ticket_id] ([remote_name])"
    
    def self.command_string(branch_name, ticket_id, args)
      command_string = "git branch -d #{branch_name}"
      if !args.empty?
        remote_name = args.shift
        command_string +="; git push #{remote_name} :#{branch_name}"
      end
      return command_string
    end
  end
end