class Mailer < ActionMailer::Base

  default from: "letmedoit2013@gmail.com"

  def bid_notification(bid)
    @bid = bid
  	@task = Task.find(bid.task_id)
    @project = Project.find(@task.project_id)
  	@user = User.find(@project.user_id)
  	mail(:to => @user.email, :subject => "New Bid on task: #{@task.name}")
  end

  def bid_accepted(task)
    @task = task
    @bid = Bid.find(@task.bid_id)
    @user = @bid.user
    mail(:to => @user.email, :subject => "Your bid on #{task.name} has been accepted")
  end

  def bid_declined(task, bid)
    @task = task
    @user = bid.user
    mail(:to => @user.email, :subject => "Unfortunately your bid on #{task.name} has been declined")
  end

end
