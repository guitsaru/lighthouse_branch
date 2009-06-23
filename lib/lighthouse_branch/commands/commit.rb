module Command
  class Commit < Command::Base
    command_name :commit
    number_of_arguments 1
    
    usage "lh-branch commit [ticket_id] [message]"
    
    def self.command_string(lighthouse_branch, ticket_id, args)
      "git commit -a -m \"#{args.shift}\n\n[##{ticket_id}]\""
    end
  end
end