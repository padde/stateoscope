namespace :stateoscope do
  desc 'visualize state machine for a given class'
  task :visualize, [:class, :state_machine_name, :current_state] => :environment do |t, args|
    fail ArgumentError, 'missing required argument <class>' unless args[:class].present?
    klass = args[:class].classify.constantize
    Stateoscope.visualize(klass, state_machine_name: args[:state_machine_name], current_state: args[:current_state])
  end
end
