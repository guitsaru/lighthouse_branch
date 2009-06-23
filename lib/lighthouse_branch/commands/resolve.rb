module Command
  class Resolve < Command::Base
    command_name :resolve
    
    def self.command_string(lighthouse_branch, ticket_id, args)
      "git commit -a -m \"#{args.shift}\n\n[##{ticket_id} state:resolved]\""
    end
  end
end