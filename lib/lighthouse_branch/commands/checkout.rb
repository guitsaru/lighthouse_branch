module Command
  class Checkout < Command::Base
    command_name :checkout
    number_of_arguments 0
    
    usage "lh-branch checkout [ticket_id]"
    
    def self.command_string(lighthouse_branch, ticket_id, args)
      "git checkout #{lighthouse_branch.branch_name(ticket_id)}"
    end
  end
end