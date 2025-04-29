# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all

    can :manage, Post, user_id: user.id if user.persisted?
  end
end
