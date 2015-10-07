module Stateoscope
  class Railtie < Rails::Railtie
    rake_tasks do
      Dir.glob File.expand_path('../../tasks/*.rake', __FILE__) do |rake_task|
        load rake_task
      end
    end
  end
end
