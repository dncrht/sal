module Sal
  class Engine < ::Rails::Engine
    # We want all the helpers to be used in the app
    #isolate_namespace Sal

    config.app_generators do |g|
      g.template_engine :showless_scaffold
      g.scaffold_controller :helperless_scaffold_controller
      g.stylesheets false
      g.javascripts false
    end
  end
end
