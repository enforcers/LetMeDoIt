class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :admin
      can :manage, :all
    elsif user.role? :registered
      # Grant rights for Skill Model
      can [:update, :destroy], Skill, :user_id => user.id
      can [:read, :create], Skill

      # Grant rights for Project Model
      can [:update, :destroy, :self], Project, :user_id => user.id
      can [:read, :create], Project

      # Grant rights for Bid Model
      can :self, Bid
      can :create, Bid do |bid|
        (bid.task.bids & Bid.for_user(user)).blank? &&
        bid.task.accepted.nil? &&
        bid.task.project.user != user
      end

      # Grant rights for Tasks Model
      can :create, Task, :project => { :user_id => user.id }
      can [:update, :destroy], Task, :project => { :user_id => user.id }, :accepted => nil
      can :read, Task

      can :read, User

      # Notifications
      can [:show_notifications, :destroy_notification], User, :user_id => user.id
    else
      can :read, :all
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
