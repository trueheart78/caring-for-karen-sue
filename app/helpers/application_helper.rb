# frozen_string_literal: true

module ApplicationHelper
  def current_charity
    Charity::ShilohHouse
  end

  def google_analytics?
    google_analytics_key.present? && google_analytics_site.present?
  end

  def google_analytics_key
    ENV.fetch('GOOGLE_ANALYTICS_KEY', nil)
  end

  def google_analytics_site
    ENV.fetch('GOOGLE_ANALYTICS_SITE', nil)
  end
end
