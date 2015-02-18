class Ability
  include CanCan::Ability

  def initialize(user)

      if user.present?
        #Registered user
        can :manage, :all
      end

      if (not user.present?)
        #Guest User
        can :read, :all
      end

  end
end