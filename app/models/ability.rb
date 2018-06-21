class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user
    if user.role? :super_admin
      can :access, :rails_admin
      can :dashboard, :all
      can :manage, :all
    elsif user.role? :admin
      can :access, :rails_admin
      can :dashboard, :all
      can :manage, [Article, Comment]
      can :read, :all
    elsif user.role? :consultant
      can :manage, [Article, Comment], user_id: user.id
      can :show, [Article, Comment]
    elsif user.role? :free_supplier
      can :manage, [Article, Comment], user_id: user.id
      can :show, [Article, Comment]
    elsif user.role? :standart_supplier
      can :manage, [Article, Comment], user_id: user.id
      can :show, [Article, Comment]
    end
  end
end