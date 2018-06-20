class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user
    can :access, :rails_admin
    can :dashboard, :all
    if user.role? :super_admin
      can :manage, :all
    elsif user.role? :admin
      can :manage, [User, Article, Comment]
      can :read, :all
    elsif user.role? :consultant
      can :read, :all
    elsif user.role? :free_supplier
      can :read, :all
    elsif user.role? :standart_supplier
      can :read, :all
    end
  end
end
