if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_event_app", domain: "bld-event-api.herokuapp.com"
else
  Rails.application.config.session_store :cookie_store, key: "_event_app"
end
