require 'lighthouse-api'
require 'grit'
require File.join(File.dirname(__FILE__), 'lighthouse_branch', 'command', 'base')

Dir.glob(File.join(File.dirname(__FILE__), 'lighthouse_branch', 'commands', '**.rb')).each { |command| require command }

class LighthouseBranch
  def initialize(project)
    @project = project
  end
  
  def self.get_lighthouse_account
    repo = Grit::Repo.new(Dir.pwd)

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
  
  def branch_name(id)
    "#{id}-#{ticket(id).title.gsub(/[^\w ]/, '').gsub(/[^a-z0-9]+/i, '-').downcase}"
  end
  
  def self.invoke(args)
    get_lighthouse_account
    
    if Command::Base.command_regexes.select{ |command| args.first =~ command }.empty?
      unless (true if Float(args.first) rescue false)
        usage
        exit
      end
    end
    
    Command::Base.invoke(args, new(@project))
  end
  
  def self.usage
    puts "Usage:"
    puts "lh-branch [ticket_id]"
    puts "lh-branch push [ticket_id] [remote name]"
    puts "lh-branch pull [ticket_id] [remote name]"
    puts "lh-branch merge [ticket_id]"
    puts "lh-branch checkout [ticket_id]"
    puts "lh-branch delete [ticket_id]"
    puts "lh-branch resolve 1 [message]"
  end
end