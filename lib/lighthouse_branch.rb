require 'lighthouse-api'

class LighthouseBranch
  def initialize(account, token, project_id)
    Lighthouse.account = account
    Lighthouse.token = token
    @project = Lighthouse::Project.find(project_id)
  end
  
  def ticket(id)
    Lighthouse::Ticket.find(id, :params => { :project_id => @project.id })
  end
  
  def branch_name(id)
    "#{id}-#{ticket(id).title.gsub(/[^\w ]/, '').gsub(/[^a-z0-9]+/i, '-').downcase}"
  end
end