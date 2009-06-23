module Command
  class Checkout < Command::Base
    command_name :checkout
    
    def self.command_string(lighthouse_branch, ticket_id, args)
      "git checkout #{lighthouse_branch.branch_name(ticket_id)}"
    end
  end
end