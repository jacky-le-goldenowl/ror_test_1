class MostFollowerService < ApplicationService
  def initialize; end

  def call
    followers = User.joins(:followers).order("count(followers.user_id) desc")
    followers.first(10)
  end
end
