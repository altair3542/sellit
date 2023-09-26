module Authorization
  extend ActiveSupport::Concern

  included do
    class NoAuthorizedError < StandardError; end

    rescue_from NoAuthorizedError do
      redirect_to products_path, alert: t('common.not_authorized')
    end

    def authorize! record = nil
      is_allowed = "#{controller_name.singularize}Policy".classify.constantize.new(record).send(action_name)
      raise NoAuthorizedError unless is_allowed
    end
  end
end
