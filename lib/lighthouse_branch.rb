require 'lighthouse-api'
require 'grit'
require File.join(File.dirname(__FILE__), 'lighthouse_branch', 'command', 'base')

Dir.glob(File.join(File.dirname(__FILE__), 'lighthouse_branch', 'commands', '**.rb')).each { |command| require command }

class LighthouseBranch
  def self.repo
    @repo ||= Grit::Repo.new(Dir.pwd)
  end
  
  def self.get_lighthouse_account
    Lighthouse.account = repo.config["lighthouse.account"]
    Lighthouse.token = repo.config["lighthouse.token"]
    
    begin
      @project = Lighthouse::Project.find(repo.config["lighthouse.project"])
    rescue
      puts "You must add your lighthouse account info to git config:"
      puts "git config lighthouse.account [lighthouse account subdomain]"
      puts "git config lighthouse.token [lighthouse API token]"
      puts "git config lighthouse.project [lighthouse project id]"
      exit
    end
  end
  
  def ticket(id)
    Lighthouse::Ticket.find(id, :params => { :project_id => @project.id })
  end
  
  def self.branch_name
    unless @branch_name
      if(Float(args.first) rescue false)
        ticket_id = args.shift
        @branch_name = "#{ticket_id}-#{ticket(ticket_id).title.gsub(/[^\w ]/, '').gsub(/[^a-z0-9]+/i, '-').downcase}"
      else
        @branch_name = repo.head.name
      end
    end
    
    return @branch_name
  end
  
  def self.invoke(args)
    get_lighthouse_account
    
    command = :default
    if Command::Base.command_regexes.select{ |command| args.first =~ command }.empty?
      ticket_id = branch_name.to_i
      if ticket_id == 0
        usage
        exit
      end
    else
      command = args.shift
      ticket_id = branch_name.to_i
    end
    
    Command::Base.invoke(command, branch_name, ticket_id, args)
  end
  
  def self.usage
    puts "Usage:"
    puts "lh-branch [ticket_id] ([remote_name])"
    puts "lh-branch push [ticket_id] [remote_name]"
    puts "lh-branch pull [ticket_id] [remote_name]"
    puts "lh-branch merge [ticket_id]"
    puts "lh-branch checkout [ticket_id]"
    puts "lh-branch update [ticket_id] [message] ([extra])"
    puts "lh-branch delete [ticket_id] ([remote_name])"
    puts "lh-branch delete_remote [ticket_id] [remote_name]"
    puts "lh-branch resolve [ticket_id] [message]"
  end
end