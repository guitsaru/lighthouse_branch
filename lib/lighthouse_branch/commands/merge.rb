module Command
  class Merge < Command::Base
    command_name :merge
    number_of_arguments 0
    
    usage "lh-branch merge [ticket_id]"
    
    def self.command_string(branch_name, ticket_id, args)
      "git merge #{branch_name}"
    end
  end
end