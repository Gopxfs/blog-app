class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.nil?

    return can :manage, :all if user.role == 'admin'

    can :delete_post, Post, author: user
    can :delete_comment, Comment, author: user
  end
end
