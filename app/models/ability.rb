class Ability
  include CanCan::Ability

  
  def initialize(user)
   can :create, Community
  can :read, Community
    can :update, Community do |community|
    community.user == user
  end
  can :delete, Community do |community|
    community.user == user
  end
  end
end
