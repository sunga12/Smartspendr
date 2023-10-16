class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new # guest user (not logged in)
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities'

    return unless user.present?

    can :manage, Entity, user: user
    can :manage, Group
  end
end
