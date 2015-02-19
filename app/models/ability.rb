class Ability
  include CanCan::Ability

  def initialize(user)

      if user.present?
        #Registered user
        can :read, :all
        #can :manage, UserBusiness

        if user.has_role? :business_admin
          #admin
          can :manage, [:business, :user_businesses]
        end

        if user.has_role? :global_admin
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