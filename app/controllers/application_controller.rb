class ApplicationController < ActionController::Base
  around_action :switch_locale

  def switch_locale(&action)
    I18n.with_locale(locale_from_header, &action)
  end

  private

  def locale_from_header
    request.env.fetch('HTTP_ACCEPT_LANGUAGE', I18n.default_locale.to_s)
  end
end
