require File.expand_path('../boot', __FILE__)

<<<<<<< HEAD
require'rails'
# Pick the frameworks you want:
=======
require 'rails'
>>>>>>> 356004126b0ef459334a0ae7fe1548f703286721
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'
<<<<<<< HEAD
# require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
=======
>>>>>>> 356004126b0ef459334a0ae7fe1548f703286721
Bundler.require(*Rails.groups)

module SlobodaEduDashboard
  class Application < Rails::Application
<<<<<<< HEAD
    # config.time_zone = 'Central Time (US & Canada)'

    # config.i18n.load_path +=
    # Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
=======
>>>>>>> 356004126b0ef459334a0ae7fe1548f703286721
    config.active_record.raise_in_transactional_callbacks = true

    config.generators do |g|
      g.factory_girl false
    end
  end
end
