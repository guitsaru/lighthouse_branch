module Command
  class Commit < Command::Base
    command_name :commit
    
    def self.command_string(lighthouse_branch, ticket_id, args)
      "git commit -a -m \"#{args.shift}\n\n[##{ticket_id}]\""
    end
  end
end