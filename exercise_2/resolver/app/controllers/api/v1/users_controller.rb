module API
  module V1
    class UsersController < BaseController
      before_action :set_user

      def follow
        render_not_found unless @user.present?
        current_user.followees << @user
        render json: { message: 'Follow successfully'}
      end

      def unfollow
        followee = current_user.followed_users&.find_by(followee_id: @user.id)
        render_not_found if followee.blank?

        followee.destroy

        render_success
      end

      def user_followees
        render json: { followees: current_user.followees }
        # render json: {followees: current_user.followees, each_serializer: followee_serializer}
      end

      def user_followers
        render json: { followees: current_user.followers }
        # render json: {followees: current_user.followees, each_serializer: followee_serializer}
      end

      private ##

      def set_user
        @user = User.find_by(params[:id])
      end
    end
  end
end
