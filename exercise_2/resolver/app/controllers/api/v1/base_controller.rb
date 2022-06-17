module API
  module V1
    class BaseController < ActionController::API
      include Pundit::Authorization
      include Pagy::Backend
      include API::JSONAPIRender
      include API::ExceptionFilter

      before_action :set_active_storage_host

      protected ##

      def current_user
        User.first
      end

      def render_not_found
        render json: { errors: 'Not found'}, status: 404
      end

      def render_success
        render json: { status: :success}, status: 200
      end

      private

      def set_active_storage_host
        ActiveStorage::Current.host = request.base_url if Rails.application.config.active_storage.service == :local
      end

      def policy_scope(scope)
        super([:api, scope])
      end

      def authorize(record, query = nil)
        super([:api, record], query)
      end
    end
  end
end
