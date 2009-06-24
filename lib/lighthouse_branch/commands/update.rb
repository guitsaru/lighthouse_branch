module Command
  class Update < Command::Base
    command_name :update
    number_of_arguments (0..2)
    
    usage "lh-branch update [ticket_id] [message]"
    
    def self.command_string(branch_name, ticket_id, args)
      msg = args.shift
      extra = ""
      extra = " #{args.shift}".rstrip unless args.empty?
      
      "git commit -a -m \"#{msg}\n\n[##{ticket_id} tagged:'branch:#{branch_name}'#{extra}]\""
    end
  end
end