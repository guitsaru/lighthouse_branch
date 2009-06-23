module Command
  class Base
    @@commands = {}
    
    def self.default_command
      @@commands.merge!(:default => self)
    end
    
    def self.command_name(name)
      name = name.to_s.downcase.to_sym
      @@commands.merge!(name => self)
    end
    
    def self.commands
      return @@commands
    end
    
    def self.run(lighthouse_branch, ticket, args)
      return unless defined?(:command_string)
      system(self.command_string(lighthouse_branch, ticket, args))
    end
    
    def self.command_regexes
      @@commands.keys.map { |k| /#{k}/i }
    end
    
    def self.invoke(args, lighthouse_branch)
      command = @@commands[args[0].to_s.downcase.to_sym]
      if command
        args.shift
      else
        command = @@commands[:default]
      end
      
      ticket_id = args.shift.to_i
      
      return nil if ticket_id <= 0
      command.run(lighthouse_branch, ticket_id, args)
    end
  end
end