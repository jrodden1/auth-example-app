# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all #can see and do everything 
        # can :destroy, Thing, deleted: true
      end
      if user.standard?
        can :create, SeedOrder
        can :read, User, id: user.id   
        #essentially, this is SQL query-esque.  If the user is a Standard user, they can READ, from the User model, all user information where the id of the user is their own user.id 
        can :update, SeedOrder#, user_id: user.id -- I don't have the models connected but if I did, this would say, I can edit any seed order that has my user.id 
        # Basic syntax
        # can :update, Thing, deleted: false
      end
      if user.viewer? 
        can :read, SeedOrder# (this will allow viewing of all seed orders)
      end
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
