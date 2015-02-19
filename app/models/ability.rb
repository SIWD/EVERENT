class Ability
  include CanCan::Ability

  def initialize(user)

      if user.present?
        #Registered user
        can :read, :all
        can :manage, UserBusiness

        if user.has_role? :admin
          #admin
          can :manage, :all
        end

      end

      if (not user.present?)
        #Guest User
        can :read, :all
      end

  end
end