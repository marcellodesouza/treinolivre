class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :Admin
      can :manage, :all 
      cannot :destroy, User, :id => user.id
    end

    if user.role? :Aluno
      can :read, Course 
      can :read, User, :id => user.id #a ordem das actions importa no controle das views
      #cannot :index, User
      can :update, User, :id => user.id
      can :read, User, :id => user.id
      cannot :destroy, User, :id => user.id
      cannot :index, User #para negar a index ela deve ser a última
    end

    if user.role? :Gestor
      can :read, Course
      can :read, Activity
      can :read, Lesson
      can :update, Company, :id => user.company_id
      can :read, Company, :id => user.company_id
      #can :read, User, :id => user.id
      #can :create, User
      #can :manage, User, :id => user.id
      cannot :destroy, Company 
      cannot :index, Company
      can :manage, User, :company_id => user.company_id
      cannot :destroy, User, :id => user.id
    end

    if user.role? :Orientador
      can :create, User
      can :read, User, :company_id => user.company_id
      can :update, User, :id => user.id
      cannot :destroy, User, :id => user.id
      can :read, Course
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
