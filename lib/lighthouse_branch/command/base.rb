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
    
    def self.number_of_arguments(arguments)
      self.class_eval("@@number_of_arguments = #{arguments}")
    end
    
    def self.usage(usage=nil)
      if usage
        return self.class_eval("@@usage = \"#{usage}\"")
      else
        return self.class_eval("@@usage")
      end
    end
    
    def self.commands
      return @@commands
    end
    
    def self.run(lighthouse_branch, ticket, args)
      return unless defined?(:command_string)
      
      number_of_arguments = (self.class_eval("@@number_of_arguments") || 0)
      
      correct_arguments = false
      if number_of_arguments.is_a?(Range)
        correct_arguments = number_of_arguments.member?(args.size)
      elsif number_of_arguments.is_a?(Fixnum)
        correct_arguments = (number_of_arguments == args.size)
      end
      
      if correct_arguments
        system(self.command_string(lighthouse_branch, ticket, args))
      else
        puts self.usage and exit
      end
    end
    
    def self.command_regexes
      @@commands.keys.map { |k| /#{k}/i }
    end
    
    def self.invoke(command, branch_name, ticket_id, args)
      command = @@commands[command.to_s.downcase.to_sym]
      if !command
        command = @@commands[:default]
      end
      
      return nil if ticket_id <= 0
      command.run(branch_name, ticket_id, args)
    end
  end
end